#Maintainer: CrankySupertoon <crankysupertoon@gmail.com>
#For any Readers out here. Yes im extracting the flatpak. Dont ask

pkgname=toontown-rewritten
pkgver=1.2.3
pkgrel=3
gitcommit="54fa8cb3feca7d1a00ac88a12afaa6524ce8c904"
ostreecommit="9119a18c449ddeb2304bac358157aa6cdbce0d1f706992b6b87396c51a5ff50b"
pkgdesc="An MMO originally by Disney, rewritten. An account is needed to play."
arch=("x86_64")
license=("custom")
depends=("qt5-base" "openal" "gendesk" "python")
makedepends=("ostree" "git" "sed")
source=("toontown-rewritten::git+https://github.com/Xytime/Xytime.github.io.git" "toontown.py")
md5sums=('SKIP' 'SKIP')

prepare() {
    # Checkout Git Project to right version
    cd "${srcdir}/${pkgname}"
    git reset --hard ${gitcommit}

    # Extract toontown from the embeddded ostree repo
    cd "${srcdir}/${pkgname}/flatpaks/"
    rm -rfd ${ostreecommit}
    ostree checkout --repo=repo -U ${ostreecommit}

    # Put Fixed Executable in right directory
    cd "${srcdir}"
    cp "toontown.py" "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/lib/python3.7/site-packages/"

    # Fix Assets Directory
    cd "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/lib/python3.7/site-packages"
    mkdir -p assets
    mv "../../../share/ttassets/resources/"*  "assets"

    # Cleanup Unwanted Data
    cd "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/lib/python3.7/site-packages"
    rm -rf bsdiff4*  certifi* chardet* idna-2* PyQt5* requests* sip* Toontown_Rewritten-123-py3.7.egg-info urllib*

    # Touch for init files
    cd "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/lib/python3.7/site-packages"
    touch "__init__.py"
    touch "fsm/__init__.py"
    touch "gui/__init__.py"
    touch "idna/__init__.py"
    touch "launcher/__init__.py"
    touch "patcher/__init__.py"

    # Fix Resources Path in Source
    cd "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/lib/python3.7/site-packages/gui"
    sed -i 's/"\/", "app", "share", "ttassets"/"\/opt\/toontown-rewritten\"/g' frame.py
    sed -i 's/resources/assets/g' frame.py
    sed -i 's/resources/assets/g' buttons.py

    # Invoke using mono in a wrapper, since wine (if installed) would open it otherwise
    cd "${srcdir}/${pkgname}"
	cat > "${pkgname}" <<-EOT
	#!/bin/sh
	cd /opt/toontown-rewritten/
	/usr/bin/python3 toontown.py
	EOT

    # Generate .desktop
    cd "${srcdir}/${pkgname}"
    gendesk --pkgname "Toontown Rewritten" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n -f
    mv "Toontown Rewritten.desktop" "${pkgname}.desktop"

    # Install Required PIP Modules
    python3 -m pip install bsdiff4
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/lib/python3.7/site-packages/"* "${pkgdir}/opt/${pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons"
    cp -Rr "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/export/share/icons/hicolor/256x256/apps/xyz.xytime.Toontown.png" "${pkgdir}/usr/share/icons/${pkgname}.png"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    cp "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
