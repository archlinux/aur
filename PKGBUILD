pkgname=makepkg-jail-local
pkgver=0.2.7
pkgrel=2
pkgdesc='Local bubblewrap makepkg sandbox with AppArmor and a restricted paru adapter'
arch=('x86_64')
license=('GPL-3.0-or-later')

depends=(
    'apparmor'
    'base-devel'
    'bash'
    'bubblewrap'
    'coreutils'
    'gnupg'
    'pacman'
    'util-linux'
)

makedepends=(
    'python'
    'python-libseccomp'
)

checkdepends=(
    'shellcheck'
)

optdepends=(
    'paru: use the paru-makepkg-jail adapter'
    'traur: pre-fetch trust scan hook'
)

install=makepkg-jail-local.install

backup=(
    'etc/apparmor.d/makepkg-jail-build'
    'etc/apparmor.d/makepkg-jail-setup'
    'etc/makepkg-jail/online-build'
)

options=(
    '!debug'
    '!strip'
)

source=(
    'makepkg-jail'
    'paru-makepkg-jail'
    'gen-seccomp.py'
    'hook-traur'
    'makepkg-jail-build'
    'makepkg-jail-setup'
    'online-build'
)

sha256sums=('dedf2cf36d0b59f94d0cd4a45fe0109f9addd480bf647b85fcf3d6cece17a3ab'
            '3da0a51a9decc3ffd9c05d194dd38baa32389d60fa76f6e1ce2457df6aa5d494'
            'ecf24a3118060612c6a38c26a038acbe6a7e5c8531bcb65837ec7d17e3d8ecbf'
            'cffe63df95629b4871bc357c96b86e632cc316c3c93d7c3ab2f34314dd492f8e'
            'c6a667a913b1d9fa745fec2e659c5c392c822093e1de9ad0ff3b03816611e001'
            '82671f29ce1fe024bc474ab3058427a4407376bd3cb920f4fac0b30cccdab1d8'
            'ea542fbd5da726cce8e3dc5efddc031415e3e8f799ec94c746dc5a2bbd6c5343')

prepare() {
    cd "$srcdir"

    python - <<'PY'
from pathlib import Path

path = Path("makepkg-jail")
text = path.read_text()

old = 'filter="$data/seccomp.bpf"'
new = 'filter="/usr/lib/makepkg-jail/seccomp.bpf"'

if text.count(old) == 1 and text.count(new) == 0:
    path.write_text(text.replace(old, new))
elif text.count(old) == 0 and text.count(new) == 1:
    pass
else:
    raise SystemExit(
        "Unexpected seccomp path configuration in makepkg-jail; refusing to patch."
    )
PY
}

build() {
    cd "$srcdir"
    python gen-seccomp.py seccomp.bpf
}

check() {
    cd "$srcdir"

    bash -n makepkg-jail
    bash -n paru-makepkg-jail
    bash -n hook-traur
    test -s seccomp.bpf
    shellcheck makepkg-jail paru-makepkg-jail hook-traur

    apparmor_parser -Q -T -o /dev/null makepkg-jail-build
    apparmor_parser -Q -T -o /dev/null makepkg-jail-setup
}

package() {
    cd "$srcdir"

    install -Dm755 makepkg-jail \
        "$pkgdir/usr/bin/makepkg-jail"

    install -Dm755 paru-makepkg-jail \
        "$pkgdir/usr/bin/paru-makepkg-jail"

    install -Dm644 seccomp.bpf \
        "$pkgdir/usr/lib/makepkg-jail/seccomp.bpf"

    install -Dm644 gen-seccomp.py \
        "$pkgdir/usr/share/makepkg-jail/gen-seccomp.py"

    install -Dm755 hook-traur \
        "$pkgdir/usr/share/makepkg-jail/hooks/traur"

    install -dm755 "$pkgdir/etc/makepkg-jail/pre-fetch.d"

    install -Dm644 makepkg-jail-build \
        "$pkgdir/etc/apparmor.d/makepkg-jail-build"

    install -Dm644 makepkg-jail-setup \
        "$pkgdir/etc/apparmor.d/makepkg-jail-setup"

    install -Dm644 online-build \
        "$pkgdir/etc/makepkg-jail/online-build"
}
