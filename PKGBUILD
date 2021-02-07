# Maintainer: Nora Hanegan <norahanegan@gmail.com>
# For any readers out here. Yes I am extracting the flatpak. Do not ask

pkgname=toontown-rewritten
pkgver=1.2.6
pkgrel=1
gitcommit="1e00a84b5b99a4cc908e148a842764b7d7f2147f"
ostreecommit="fae3ef042879e237000e98aea20c1b1cb72c074f24c9c87813677a781f5d353e"
pkgdesc="An MMO originally by Disney, rewritten. An account is needed to play."
arch=("x86_64")
license=("custom")
depends=("qt5-base" "openal" "gendesk" "python" "python-pyqtwebengine" "python-bsdiff4")
makedepends=("ostree" "git" "sed")
source=("toontown-rewritten::git+https://github.com/0xAURORA/0xAURORA.github.io.git")
md5sums=('SKIP')

prepare() {
    # Checkout git project to right version
    cd "${srcdir}/${pkgname}"
    git reset --hard ${gitcommit}

    # Extract toontown from the embeddded ostree repo
    cd "${srcdir}/${pkgname}/flatpaks/"
    rm -rfd ${ostreecommit}
    ostree checkout --repo=repo -U ${ostreecommit}

    # Put executable in right directory
    cd "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/bin/"
    cp "./toontown" "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/lib/python3.7/site-packages/toontown.py"

    # Fix assets directory
    cd "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/lib/python3.7/site-packages"
    mkdir -p assets
    mv "../../../share/ttassets/resources/"*  "assets"

    # Cleanup unwanted data
    cd "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/lib/python3.7/site-packages"
    rm -rf bsdiff4* certifi* chardet* idna-2* PyQt5* requests* sip* Toontown_Rewritten-123-py3.7.egg-info urllib*

    # Touch for init files
    cd "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/lib/python3.7/site-packages"
    touch "__init__.py"
    touch "fsm/__init__.py"
    touch "gui/__init__.py"
    touch "idna/__init__.py"
    touch "launcher/__init__.py"
    touch "patcher/__init__.py"

    # Fix directory hardcoded into the launcher from the flatpak
    cd "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/lib/python3.7/site-packages/"
    sed -i 's/copyfile("\/app\/share\/ttassets\/resources\/settings.json", "settings.json")//g' toontown.py

    # Fix Resources Path in Source
    cd "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/lib/python3.7/site-packages/gui"
    sed -i 's/"\/", "app", "share", "ttassets"/"\/opt\/toontown-rewritten\"/g' frame.py
    sed -i 's/resources/assets/g' frame.py
    sed -i 's/resources/assets/g' buttons.py

    # Update the launcher version inside the flatpak
    cd "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/lib/python3.7/site-packages/launcher/"
    sed -i 's/1.2.3-py3/1.2.6/g' settings.py

    # Remove the patching from the launcher since it is broken on linux
    cd "${srcdir}/${pkgname}/flatpaks/${ostreecommit}/files/lib/python3.7/site-packages/launcher/"
    sed -i 's/while self.patcher.isAlive()://' launcher.py
    sed -i 's/time.sleep(0.2)//' launcher.py

    # Generate startup executable
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
