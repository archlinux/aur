# Former Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Current Maintainer: Ning Sun <sunng@about.me>
pkgname=eclipse-mat
_pgname=MemoryAnalyzer
_pkgver=1.13.0
pkgver=1.13.0
_releasedate=20220615
pkgrel=2
pkgdesc="Eclipse Memory Analyzer Tool (MAT), a toolkit for analyzing Java heap dumps."
arch=('x86_64' 'aarch64')
url="http://www.eclipse.org/mat"
license=(EPL)
depends=('java-runtime>=11' 'gtk2')
install=${pkgname}.install
sha512sums_x86_64=('2c3dc1f5805bcda2fab032bd40afa8649d99f01340f8260a69cfbac7a1a5089076f0ba13cfdcaaf1df1d03787f59bb60de5c7756ac5cd51d92bf2ed2455bdcd2')
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://www.eclipse.org/downloads/download.php?file=/mat/${_pkgver}/rcp/${_pgname}-${pkgver}.${_releasedate}-linux.gtk.x86_64.zip&r=1")
sha512sums_aarch64=('eefe786cd7f4d109ec77ba31227b696fe5338c57ab10efe7e03f3f3781e01b252cad1a748db1b69d237c4230ecf3e88cc7db994a6e53abbcffe2f9aa04ee054c')
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
