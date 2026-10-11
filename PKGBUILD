# Former Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Current Maintainer: Ning Sun <sunng@about.me>
pkgname=eclipse-mat
_pgname=MemoryAnalyzer
_pkgver=1.17.0
pkgver=1.17.0
_releasedate=20260601
pkgrel=1
pkgdesc="Eclipse Memory Analyzer Tool (MAT), a toolkit for analyzing Java heap dumps."
arch=('x86_64' 'aarch64')
url="http://www.eclipse.org/mat"
license=(EPL)
depends=('java-runtime>=17')
install=${pkgname}.install
sha512sums_x86_64=('a4127c587d425cbe7167873fdc1337950ee7c01bf15dd429b6ad3f26e8ba3bbd0aee9a693aff60f25d6068c9e817b1de617ac94c85ece15a48fda17c1b9b12cd')
sha512sums_aarch64=('8dc5c85c6f09813826c8bd3d9cf3748020d271e3e446f531fe90698a9800e91c5ad3a87a4c66a2f105dbd5d43d9919434ec2f44391dc03621050cd76f962fe4b')
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
