# Maintainer: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Krzysztof Bogacki <krzysztof dot bogacki at leancode dot pl>

_provide_nondkms=false # Don't use until bcachefs prerequisites are merged.
_provide_dkms=true
_use_sparse_clone=true

_pkgbase='bcachefs'
pkgbase="$_pkgbase-git"
pkgname=()
pkgver=6.5.0.r2724.g493c276
pkgrel=1
pkgdesc="The COW filesystem for Linux that won't eat your data"
arch=('any')
url='https://bcachefs.org/'
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
_nondkms_depends=('linux')
_dkms_depends=('dkms')
_nondkms_makedepends=('linux-headers' 'dkms')
_dkms_optdepends=('linux-headers: build the module for Arch kernel')
_nondkms_conflicts=("$_pkgbase-git" "$_pkgbase")
_dkms_conflicts=("$_pkgbase-dkms-git" "$_pkgbase-dkms")
_module_provides=("BCACHEFS-MODULE=$pkgver")
license=('GPL2')
options=('!strip')
source=("git+https://github.com/koverstreet/bcachefs.git"
        'Makefile'
        'dkms.conf')
sha256sums=('SKIP'
            'd7fa983a3a03a68974ffbc5c96a0c9c7978e2b4001c2305896ba8085c772aa43'
            '50826b5e67199ee8e597e5c3ab20f5170113aab9abff1ce26f96abbe3df24372')

if [ "${PRINTSRCINFO:-0}" -eq 1 ]; then
    #_provide_nondkms=true
    _provide_dkms=true
fi

if [ "$_provide_nondkms" = true ]; then
    pkgname+=("$_pkgbase-git")
    makedepends+=("${_nondkms_makedepends[@]}")
fi
if [ "$_provide_dkms" = true ]; then
    pkgname+=("$_pkgbase-dkms-git")
fi

pkgver() {
    local m="$(head "$srcdir/$_pkgbase/Makefile")"
    local ver="$(echo "$m" | sed -n 's/^VERSION = \(.*\)$/\1/p')"
    local patchlvl="$(echo "$m" | sed -n 's/^PATCHLEVEL = \(.*\)$/\1/p')"
    local sublvl="$(echo "$m" | sed -n 's/^SUBLEVEL = \(.*\)$/\1/p')"
    local extraver="$(echo "$m" | sed -n 's/^EXTRAVERSION = \(.*\)$/\1/p')"
    local kernver="${ver}${patchlvl:+.${patchlvl}}${sublvl:+.${sublvl}}${extraver:+.${extraver}}"
    local commit="$(git -C "$srcdir/$_pkgbase" describe --long --abbrev=7 | sed 's/^.*-\([^-]*-g\)/r\1/;s/-/./g')"
    printf "%s.%s" "$kernver" "$commit"
}

if [ "$_provide_nondkms" = true ] || [ "$_provide_dkms" = true ]; then
prepare() {
    local kernver="${pkgver%.${pkgver#*.*.}}"
    sed -i -e "s/@PACKAGE_VERSION@/$pkgver/g" -e "s/@KERNEL_VERSION@/${kernver//./\\\\.}/g" "$srcdir/dkms.conf"
}
fi

if [ "$_provide_nondkms" = true ]; then
build() {
    _kernver="$(cat /usr/src/linux/version)"
    install -Dm644 "$srcdir/Makefile" "$srcdir/$_pkgbase-$pkgver/Makefile"
    install -Dm644 "$srcdir/dkms.conf" "$srcdir/$_pkgbase-$pkgver/dkms.conf"
    install -d -Dm755 "$srcdir/$_pkgbase-$pkgver/src/fs/bcachefs"
    install -m644 -t "$srcdir/$_pkgbase-$pkgver/src/fs/bcachefs" "$srcdir/$_pkgbase/fs/bcachefs"/*
    sed -i 's/$(CONFIG_BCACHEFS_FS)/m/g' "$srcdir/$pkgbase-$pkgver/src/fs/bcachefs/Makefile"
    sed -i "s%^#define TRACE_INCLUDE_PATH \\.\\./\\.\\./fs/bcachefs\$%#define TRACE_INCLUDE_PATH $srcdir/$_pkgbase-$pkgver/src/fs/bcachefs%" "$srcdir/$_pkgbase-$pkgver/src/fs/bcachefs/trace.h"
    mkdir "$srcdir/build"
    fakeroot dkms build --sourcetree "$srcdir" --dkmstree "$srcdir/build" -m "$_pkgbase/$pkgver" -k "$_kernver"
}
package_bcachefs-git() {
    pkgdesc+=" - out-of-tree module"
    arch=("$CARCH")
    depends=("${_nondkms_depends[@]}")
    conflicts=("${_nondkms_conflicts[@]}")
    provides=("${_module_provides[@]}")
    _kernver="$(cat /usr/src/linux/version)"
    install -t "$pkgdir/usr/lib/modules/$_kernver/extramodules" -Dm644 "$srcdir/build/$_pkgbase/$pkgver/$_kernver/$CARCH/module"/*
    find "$pkgdir" -name '*.ko' -exec xz -T1 '{}' \+
}
fi
if [ "$_provide_dkms" = true ]; then
package_bcachefs-dkms-git() {
    pkgdesc+=" - out-of-tree module (dkms version)"
    depends=("${_dkms_depends[@]}")
    optdepends=("${_dkms_optdepends[@]}")
    conflicts=("${_dkms_conflicts[@]}")
    provides=("${_module_provides[@]}")
    install -Dm644 "$srcdir/Makefile" "$pkgdir/usr/src/$_pkgbase-$pkgver/Makefile"
    install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"
    install -d -Dm755 "$pkgdir/usr/src/$_pkgbase-$pkgver/src/fs/bcachefs"
    install -m644 -t "$pkgdir/usr/src/$_pkgbase-$pkgver/src/fs/bcachefs" "$srcdir/$_pkgbase/fs/bcachefs"/*
    sed -i 's/$(CONFIG_BCACHEFS_FS)/m/g' "$pkgdir/usr/src/$_pkgbase-$pkgver/src/fs/bcachefs/Makefile"
    sed -i "s%^#define TRACE_INCLUDE_PATH \\.\\./\\.\\./fs/bcachefs\$%#define TRACE_INCLUDE_PATH /usr/src/$_pkgbase-$pkgver/src/fs/bcachefs%" "$pkgdir/usr/src/$_pkgbase-$pkgver/src/fs/bcachefs/trace.h"
}
fi

if [ "$_use_sparse_clone" = true ]; then
eval "_$(declare -f download_git)"
download_git() {
    if [ "$1" = 'git+https://github.com/koverstreet/bcachefs.git' ]; then
        git() {
            if [ $# -eq 4 ] && [ "$1" = clone ] && [ "$2" = --mirror ] && [ "$3" = 'https://github.com/koverstreet/bcachefs.git' ] && [ -d "${4%/*}" ]; then
                command git clone --mirror "$3" "$4" --depth=1 --filter=tree:0 || return
                command git -C "$4" config --local core.sparseCheckout true || return
                echo /Makefile >"$4"/info/sparse-checkout || return
                echo /fs/bcachefs >>"$4"/info/sparse-checkout || return
                local tmpdir="$(mktemp -d)" || return
                command git -C "$4" worktree add --detach "$tmpdir" || return
                command git -C "$4" worktree remove "$tmpdir" || return
                rm -rf "$tmpdir"
                command git -C "$4" fetch origin --tags --depth=1 --filter=tree:0 || return
                local tag="$(git -C "$4" for-each-ref --sort=-taggerdate 'refs/tags/v*' --exclude='refs/tags/v*[^0-9.]*' --exclude='refs/tags/*-*' --format='%(refname)' --count=2 | tail -n 1)" || return
                command git -C "$4" fetch --shallow-exclude="$tag" --filter=tree:0 || return
            elif [ "$1" = fetch ]; then
                shift
                command git fetch "$@" -n --depth=1 --filter=tree:0 || return
                local tmpdir="$(mktemp -d)" || return
                command git worktree add --detach "$tmpdir" || return
                command git worktree remove "$tmpdir" || return
                rm -rf "$tmpdir"
                command git fetch origin --tags --depth=1 --filter=tree:0 || return
                local tag="$(git for-each-ref --sort=-taggerdate 'refs/tags/v*' --exclude='refs/tags/v*[^0-9.]*' --exclude='refs/tags/*-*' --format='%(refname)' --count=2 | tail -n 1)" || return
                command git fetch --shallow-exclude="$tag" --filter=tree:0 || return
            else
                command git "$@"
            fi
        }
        _download_git "$@"
        local ret=$?
        unset -f git
        return $ret
    fi
    _download_git "$@"
}
eval "_$(declare -f extract_git)"
extract_git() {
    if [ "$1" = 'git+https://github.com/koverstreet/bcachefs.git' ]; then
        git() {
            if [ $# -eq 4 ] && [ "$1" = clone ] && [ -d "$3" ] && [ "$4" = bcachefs ]; then
                local tmpdir="$(mktemp -d)" || return
                command git -C "$3" worktree add --detach "$tmpdir" || return
                command git clone -s "$tmpdir" "$4" -n
                command git -C "$4" config --local core.sparseCheckout true || return
                cp "$3"/info/sparse-checkout "$4"/.git/info/sparse-checkout
                command git -C "$4" checkout 2>/dev/null || return
                command git -C "$4" remote set-url origin "$3"
                command git -C "$3" worktree remove "$tmpdir" || return
                rm -rf "$tmpdir"
            else
                command git "$@"
            fi
        }
        _extract_git "$@"
        local ret=$?
        unset -f git
        return $ret
    fi
    _extract_git "$@"
}
fi
