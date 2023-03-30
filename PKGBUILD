# Former Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Current Maintainer: Ning Sun <sunng@about.me>
pkgname=eclipse-mat
_pgname=MemoryAnalyzer
_pkgver=1.14.0
pkgver=1.14.0
_releasedate=20230315
pkgrel=1
pkgdesc="Eclipse Memory Analyzer Tool (MAT), a toolkit for analyzing Java heap dumps."
arch=('x86_64' 'aarch64')
url="http://www.eclipse.org/mat"
license=(EPL)
depends=('java-runtime>=11' 'gtk2')
install=${pkgname}.install
sha512sums_x86_64=('f9cf4f4fc7f85706a572fbd8f776bf06091b09cd5bf648406f6857fe45301b35c95099635b126aecca0857f0343872071375c49735dcc42cbd7e77e462b38466')
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://www.eclipse.org/downloads/download.php?file=/mat/${_pkgver}/rcp/${_pgname}-${pkgver}.${_releasedate}-linux.gtk.x86_64.zip&r=1")
sha512sums_aarch64=('21df338339920b564920eaa4565dfd7bed267d2b98d57158c5475db2eefb7b07a899e0f4a7d22f2bbcd7e5f919e2c7a711d529ee1a378a94fd13a0dd90ae58cd')
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
