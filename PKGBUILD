pkgname=makepkg-jail-local
pkgver=0.2.1
pkgrel=1
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
)

sha256sums=('1757680a06682dfbe92920e3bde4a71cd3ab4286e9fe90f7c01a61cf09c4516c'
            'a1af793a1f84ddb64bce6aeb6b6dcf2fac71f26c2d1a9acd534af79b329ef0b5'
            'ecf24a3118060612c6a38c26a038acbe6a7e5c8531bcb65837ec7d17e3d8ecbf'
            '4336aa8db4b217342dac97d80ad0a8e80fc2db581cba1c39f74c1f781eb5e20f'
            'c6a667a913b1d9fa745fec2e659c5c392c822093e1de9ad0ff3b03816611e001'
            'dcc67f673415a6acbee2514e1a05a4612e1d0dd241047df2ca35f9da01584b4b')

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
}
