# Maintainer: Nixuge

pkgname=mcedit-unified-git
_pkgname=MCEdit-Unified
pkgver=1.6.0.0.r6.g90abfb17
pkgrel=3
pkgdesc='MCEdit is a versatile map utility, designed for editing Minecraft maps.'
url=http://podshot.github.io/MCEdit-Unified
arch=(x86_64)
license=(ISC)
depends=(python2) # python2-bin recommended to avoid at least 30m of build time
provides=(mcedit)
install=mcedit.install
conflicts=(mcedit)
options=(!strip)
source=("git+https://github.com/Podshot/MCEdit-Unified" "mcedit.desktop" "mcedit" "mcedit.install")
sha256sums=('SKIP' 'e36c376ea3dd1c4d31a43ce7959a8ce5805804d7e9af92c143a14b4e4ae11b86' '541319e2b1aa7d26509b7b683a694340d8df48bbad5e1eb59d2934910aa65e47' '00fdece371964410db21fbae225f8a74dd9daa22fdc468a38d7686985c525fd0')

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

post_install() {
    echo "Due to a problem with how venvs work, this package can only work if the venv is setup AFTER the pkgbuild (at least i think so)."
    echo "It is recommended for you to run mcedit the first time through a terminal (using 'mcedit') to see the progress"
    echo "After this, everything should work normally"
    echo "If (by some miracle) mcedit unified updates, you can run 'mcedit --update' to try to install the dependencies & build again."
}