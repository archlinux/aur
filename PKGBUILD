# Maintainer: kharovtobi <tugboat_khatov at outlook dot com>

_pkgname=mvisor
pkgname=$_pkgname-git
pkgver=r306.5f1d7ee
pkgrel=1
pkgdesc="A mini x86 hypervisor"
arch=('x86_64')
url="https://github.com/tenclass/mvisor"
license=('GPL-3.0')
depends=('meson' 'gdb' 'cmake' 'base-devel' 'acpica' 'git'
    'protobuf-c' 'glib2' 'libyaml' 'yaml-cpp' 'pixman' 'zstd' 'zlib'
    'sdl2-compat' 'alsa-lib'
    'gtk3'
    'virglrenderer'
    'seabios'
)
provides=('mvisor')
optdepends=('edk2-ovmf: EFI booting'
            'qemu-img: creating disk images'
)
conflicts=('mvisor')
source=("git+https://github.com/tenclass/mvisor.git"
        "qemu-compatibility.patch"
)
sha256sums=('SKIP'
            'f01aa831f081f4bb398778c31378483045a1c7f7f438257a74cc8a3e49c2e963'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    rm -rf build
    patch -p0 -i ../qemu-compatibility.patch
    meson setup build -Dsdl=true -Dgtk=true -Dvgpu=true
    meson compile -C build
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 build/mvisor "$pkgdir"/usr/bin/mvisor
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
    install -Dm644 config/sample.yaml "$pkgdir"/usr/share/"$_pkgname"/config/sample.yaml.proto
    install -Dm644 config/q35.yaml "$pkgdir"/usr/share/"$_pkgname"/config/q35.yaml.proto
    install -Dm644 config/i440fx.yaml "$pkgdir"/usr/share/"$_pkgname"/config/i440fx.yaml.proto
    install -Dm644 share/* "$pkgdir"/usr/share/"$_pkgname"/
}
