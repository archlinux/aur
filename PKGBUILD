pkgname=makepkg-jail-local
pkgver=0.2.11
pkgrel=1
pkgdesc='Local bubblewrap makepkg sandbox with AppArmor and a restricted paru adapter'
arch=('x86_64')
license=('GPL-3.0-or-later')
url='https://aur.archlinux.org/packages/makepkg-jail-local'

depends=(
    'apparmor'
    'base-devel'
    'bash'
    'bubblewrap'
    'coreutils'
    'gnupg'
    'jq'
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

sha256sums=('a2fd934a8be99207886194d2dd3603741e568bb23b64c0299024e184fbc76750'
            '3da0a51a9decc3ffd9c05d194dd38baa32389d60fa76f6e1ce2457df6aa5d494'
            '66582b5f362112c1ea5bbda70334c50b00b0eea6fa20355050260ff1da6795a7'
            'ee32a356587bc08724b84613c6bf0bddfc85f9a0f2fe53cb9f8a9620d4307aee'
            'd12cc9005cc17ee410b7727da5033c0482a1d0c5a2fd0b2ea660b4962b2284eb'
            '529a615d5230dd0e42d6e76f37c4de37a9527f91ad015b0e01c53226fb0f1c87'
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
