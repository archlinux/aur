# Maintainer: Kira Vogt <dev at prettypurple dot ink>

_pkgname=mrv2
pkgname="${_pkgname}-bin"
pkgver=1.3.2
pkgrel=0
pkgdesc="mrv2 is an open source professional player and review tool for VFX, animation and computer graphics (binaries)"
arch=("x86_64")
url="https://github.com/ggarra13/mrv2"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# URL for release downloads
_rel_url="${url}/releases/download/v${pkgver}"
license=("BSD-3-Clause")
# Helper
_pkgnameversion=${_pkgname}-v${pkgver}

source_x86_64=(${_rel_url}/${_pkgnameversion}-Linux-amd64.tar.gz)
sha256sums_x86_64=('a097fcdb7aec93bfb4455e239c438d981431abc4c9db97dbbacd29ec82e1f6c1')

prepare() {
    # Replace Exec path in application launcher file, link will be located in '/usr/bin'
    sed -r 'N;s/(Exec=).*/\1\/usr\/bin\/mrv2/' "$srcdir/${_pkgnameversion}-Linux-amd64/usr/local/${_pkgnameversion}-Linux-64/share/applications/${_pkgname}.desktop" > "$srcdir/${_pkgnameversion}-Linux-amd64/usr/local/${_pkgnameversion}-Linux-64/share/applications/fixed_exec_path.desktop"
}

package() {
    cd "$srcdir/${_pkgnameversion}-Linux-amd64/usr/local/${_pkgnameversion}-Linux-64"
    # Copy program content to /opt instead of /usr/local as manual installation would do
    install -D -m755 "bin/mrv2.sh" -t "$pkgdir/opt/${_pkgname}/bin/"
    install -D -m755 "bin/mrv2" -t "$pkgdir/opt/${_pkgname}/bin/"
    install -D -m755 "bin/environment.sh" -t "$pkgdir/opt/${_pkgname}/bin/"
    install -D -m755 "bin/python.sh" -t "$pkgdir/opt/${_pkgname}/bin/"
    install -D -m755 "bin/python3.11" -t "$pkgdir/opt/${_pkgname}/bin/"
    cp -r "icons" "$pkgdir/opt/${_pkgname}/"
    cp -r "colors" "$pkgdir/opt/${_pkgname}/"
    cp -r "docs" "$pkgdir/opt/${_pkgname}/"
    cp -r "lib" "$pkgdir/opt/${_pkgname}/"
    cp -r "libraries" "$pkgdir/opt/${_pkgname}/"
    cp -r "ocio" "$pkgdir/opt/${_pkgname}/"
    cp -r "plugin" "$pkgdir/opt/${_pkgname}/"
    cp -r "presets" "$pkgdir/opt/${_pkgname}/"
    cp -r "python" "$pkgdir/opt/${_pkgname}/"

    # Link executables
    install -d -m755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/bin/mrv2.sh" "${pkgdir}/usr/bin/mrv2"

    # License, .desktop and icon
    install -D -m644 "docs/Legal/LICENSE_mrv2.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -D -m644 "share/applications/fixed_exec_path.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -D -m644 "share/icons/hicolor/256x256/apps/${_pkgname}.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
