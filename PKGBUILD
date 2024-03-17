# Maintainer: Nixuge

pkgname=mcedit-unified-git
_pkgname=MCEdit-Unified
pkgver=1.6.0.0.r6.g90abfb17
pkgrel=5
pkgdesc='MCEdit is a versatile map utility, designed for editing Minecraft maps.'
url=http://podshot.github.io/MCEdit-Unified
arch=(x86_64)
license=(ISC)
depends=(python2 xclip) # python2-bin recommended to avoid at least 30m of build time
provides=(mcedit)
install=mcedit.install
conflicts=(mcedit)
options=(!strip)
source=("git+https://github.com/Podshot/MCEdit-Unified" "mcedit.desktop" "mcedit" "mcedit.install")
sha256sums=('SKIP' 'e36c376ea3dd1c4d31a43ce7959a8ce5805804d7e9af92c143a14b4e4ae11b86' '541319e2b1aa7d26509b7b683a694340d8df48bbad5e1eb59d2934910aa65e47' '3ce7ee0f9da93f1f7a3c7137ffd4ab8dc5f1eff590514bac0a75f4a4beadc3e3')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    # Not on windows, we don't need it
    sed -i '/pypiwin32/d' requirements.txt
    # Remove opengl lib back just in case there are fixes
    sed -i 's/==3\.1\.1a1//g' requirements.txt
    # Update pygame to latest good version (2.0.0 is broken)
    sed -i 's/pygame==1.9.4/pygame==1.9.6/' requirements.txt

    # Resize is currently broken; trying to find a fix, for now disabling it as it makes the program almost unusable (dirty)
    sed -i 's/elif type == VIDEORESIZE:/elif False:/' "albow/root.py"
}

# build() {
#     # Note: this is now done in the executable, as venvs seem to have issues
# }

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
    chmod -R 777 "${pkgdir}/opt/mcedit-unified/"
                
	# Executable
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/mcedit" "${pkgdir}/usr/bin/mcedit"
}