# Maintainer: Nixuge

pkgname=mcedit-unified-git
_pkgname=MCEdit-Unified
pkgver=1.6.0.0.r6.g90abfb17
pkgrel=1
pkgdesc='MCEdit is a versatile map utility, designed for editing Minecraft maps.'
url=http://podshot.github.io/MCEdit-Unified
arch=(x86_64)
license=(ISC)
depends=(python2) # python2-bin recommended to avoid at least 30m of build time
provides=(mcedit)
conflicts=(mcedit)
options=(!strip)
source=("git+https://github.com/Podshot/MCEdit-Unified" "mcedit.desktop" "mcedit")
sha256sums=('SKIP' 'e36c376ea3dd1c4d31a43ce7959a8ce5805804d7e9af92c143a14b4e4ae11b86' '541319e2b1aa7d26509b7b683a694340d8df48bbad5e1eb59d2934910aa65e47')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# Why prepare when you can put everything in build
build() {
    # Get in the right dir
    cd "${srcdir}/${_pkgname}"

    # Install & setup the virtualenv
    python2 -m pip install virtualenv
    python2 -m virtualenv venv
    source venv/bin/activate

    # Install the requirements
    sed -i '/pypiwin32/d' requirements.txt # Not on windows, we don't need it
    pip install -r requirements.txt
    pip install Xlib # Required on linux, see https://github.com/Podshot/MCEdit-Unified/issues/797

    # Build the libs for a faster mcedit
    python setup.py all

    deactivate
    echo ""
}

package() {
    # Desktop file
    install -Dm644 \
        "${srcdir}/mcedit.desktop" \
        "${pkgdir}/usr/share/applications/mcedit.desktop"

	# Icon images
    # Note: low res but it's either that or a png and lazy to convert + need more deps
	install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm644 "${srcdir}/${_pkgname}/favicon.png" "${pkgdir}/usr/share/icons/mcedit.png"

    # git repo
    install -dm755 "${pkgdir}/opt/mcedit-unified"
	cp -a "${srcdir}/${_pkgname}/." "${pkgdir}/opt/mcedit-unified/"
    chmod 777 "${pkgdir}/opt/mcedit-unified/"
                
	# Executable
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/mcedit" "${pkgdir}/usr/bin/mcedit"
}
