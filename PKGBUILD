# Maintainer: Uttarayan Mondal

pkgname=j2dx-git
_pkgname=Joy2DroidX-server
pkgver=23.r692dcd3
pkgrel=1
epoch=1
pkgdesc="Joy2DroidX server for linux"
url='https://github.com/OzymandiasTheGreat/Joy2DroidX-server'
arch=('x86_64')
license=('GPL')
options=()
depends=('python-uinput' 'python-eventlet' 'python-evdev' 'python-socketio' 'python-qrcode')
makedepends=('git')
optdepends=()
install=j2dx.install
source=("git://github.com/OzymandiasTheGreat/Joy2DroidX-server")


sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s" \
		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${srcdir}
    echo -e "#!/usr/bin/python3" \
         "\nimport re" \
         "\nimport sys" \
         "\nfrom j2dx import main" \
         "\nif __name__ == '__main__':" \
         "\n   sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])" \
         "\n   sys.exit(main())" > j2dx
    echo 'SUBSYSTEM=="misc", KERNEL=="uinput", MODE="0660", GROUP="uinput"' > 80-uinput.rules
    cd Joy2DroidX-server
    git apply ../../j2dx.patch
}

build() {
	cd "${_pkgname}"
}

package() {
    sitepkg="$(python -c 'from distutils.sysconfig import get_python_lib; print(get_python_lib())')"
    install -Dm644 "80-uinput.rules"            "${pkgdir}/etc/udev/rules.d/80-j2dx-uinput.rules"
    install -Dm755 "j2dx"                                   "${pkgdir}/usr/bin/j2dx"
	cd "${_pkgname}"
    install -Dm644 LICENSE                                  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 assets/tk.ozymandias.j2dx.desktop        "${pkgdir}/usr/share/applications/tk.ozymandias.j2dx.desktop"
    install -Dm644 assets/tk.ozymandias.j2dx.svg            "${pkgdir}/usr/share/icons/hicolor/tk.ozymandias.j2dx.svg"
    install -Dm644 assets/tk.ozymandias.j2dx.appdata.xml    "${pkgdir}/usr/share/metainfo/tk.ozymandias.j2dx.appdata.xml"
    install -Ddm755 j2dx                                    "${pkgdir}/${sitepkg}/j2dx"
    install -Dm644 j2dx/__init__.py                         "${pkgdir}/${sitepkg}/j2dx/__init__.py"
    install -Ddm755 j2dx/nix                                "${pkgdir}/${sitepkg}/j2dx/nix"
    install -Dm755 j2dx/nix/device.py                       "${pkgdir}/${sitepkg}/j2dx/nix/device.py"
}
