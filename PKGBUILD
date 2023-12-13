# Former Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Current Maintainer: Ning Sun <sunng@about.me>
pkgname=eclipse-mat
_pgname=MemoryAnalyzer
_pkgver=1.15.0
pkgver=1.15.0
_releasedate=20231206
pkgrel=2
pkgdesc="Eclipse Memory Analyzer Tool (MAT), a toolkit for analyzing Java heap dumps."
arch=('x86_64' 'aarch64')
url="http://www.eclipse.org/mat"
license=(EPL)
depends=('java-runtime>=11' 'gtk2')
install=${pkgname}.install
sha512sums_x86_64=('527ca60cbba618b3aee4839611865d62f1fa2e6c234837257341eb17d6e0445fcce0455d65becad71e186e1a1252eec3eb6faffac329d9e9c3b5959565e50ba1')
sha512sums_aarch64=('da148522bd5b9e0413c2d3fbdbfa227fbe4eb0e24f83ea575c76179fca1d14d758c39c7fe67edcfae7739ed032b27affd073e947bd25fc2aa91d9d47b55a99a9')
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://www.eclipse.org/downloads/download.php?file=/mat/${_pkgver}/rcp/${_pgname}-${pkgver}.${_releasedate}-linux.gtk.x86_64.zip&r=1")
source_aarch64=("${pkgname}-${pkgver}-x86_64.zip::https://www.eclipse.org/downloads/download.php?file=/mat/${_pkgver}/rcp/${_pgname}-${pkgver}.${_releasedate}-linux.gtk.aarch64.zip&r=1")

build() {
    msg2 "Generate desktop application entry..."
    cat >"${srcdir}"/${pkgname}.desktop <<EOF
[Desktop Entry]
Version=${pkgver}
Encoding=UTF-8
Name=Eclipse MAT
Comment=${pkgdesc}
Exec=/usr/bin/${pkgname}
Terminal=false
Type=Application
Categories=Development;
EOF
}

package() {
    msg2 "Install the assembly at /opt/${pkgname}..."
    install -dm755 "${pkgdir}"/opt/${pkgname}
    cp -a "${srcdir}"/mat/* "${pkgdir}"/opt/${pkgname}

    msg2 "Install link to the executable in /usr/bin..."
    install -dm755 "${pkgdir}"/usr/bin
    ln -s /opt/${pkgname}/${_pgname} "${pkgdir}"/usr/bin/${pkgname}

    msg2 "Install link to the config file in /etc..."
    install -dm755 "${pkgdir}"/etc
    ln -s /opt/${pkgname}/${_pgname}.ini "${pkgdir}"/etc/${pkgname}.ini

    msg2 "Install links to copyright resources at /usr/share/licenses/${pkgname}..."
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /opt/${pkgname}/epl-v10.html "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s /opt/${pkgname}/notice.html "${pkgdir}/usr/share/licenses/${pkgname}/"

    msg2 "Install desktop application entry in /usr/share/applications..."
    install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
