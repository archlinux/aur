# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=meshstation
pkgver=1.1.1
pkgrel=1
pkgdesc='Meshtastic SDR analyzer and desktop GUI'
arch=('x86_64')
url='https://github.com/IronGiu/MeshStation'
license=('GPL-3.0')
depends=('meshtastic-python' 'pyside6' 'python-cffi' 'python-cryptography' 'python-nicegui' 'python-protobuf'
         'python-pyqt6-webengine' 'python-pywebview' 'python-pyzmq' 'python-qtpy')
makedepends=('micromamba')
options=('!debug' '!strip')
install=meshstation.install
source=("https://github.com/IronGiu/MeshStation/archive/refs/tags/v$pkgver.tar.gz"
        "local://app_icon.svg"
        "local://meshstation"
        "local://meshstation.desktop")
sha256sums=('122e1508d13e0e564ed92d5039bc81c433079edfe991bb850b457fa4c310d392'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
	cd "MeshStation-$pkgver/engine/os/linux_x86_64"
	mamba create -f linuxenv.yml -p ./runtime -y
}

package() {
	cd "MeshStation-$pkgver"
	mkdir -p "$pkgdir/opt/MeshStation/engine/os/linux_x86_64"
	cp -rL "$srcdir/app_icon.svg" languages.json MeshStation.py offlinemaps "$pkgdir/opt/MeshStation"
	cp -r engine/meshtastic_engine "$pkgdir/opt/MeshStation/engine"
	cp -r engine/os/linux_x86_64/runtime "$pkgdir/opt/MeshStation/engine/os/linux_x86_64"
	mkdir -p -m775 "$pkgdir/opt/MeshStation/data"
	install -Dm664 /dev/null "$pkgdir/opt/MeshStation/engine/os/linux_x86_64/runtime/.conda_unpacked_ok"
	install -Dm755 "$srcdir/meshstation" "$pkgdir/usr/bin/meshstation"
	install -Dm644 "$srcdir/meshstation.desktop" "$pkgdir/usr/share/applications/meshstation.desktop"
}
