# Maintainer: taotieren <admin@taotieren.com>
pkgname=spark-store
pkgver=3.0.3
pkgrel=1
pkgdesc="生态构建需要的不是某一方的单打独斗，而是人人行动起来，汇聚星火，产生燎原之势"
arch=('x86_64')
url="https://gitee.com/deepin-community-store/spark-store"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(${pkgname})
#depends=('dpkg' 'qconf' 'dtkcore' 'dtkwidget' 'qt5-webengine' 'libnotify')
depends=('qt5-webengine' 'dtkwidget' 'libnotify')
#makedepends=('unzip' 'dpkg' 'qconf' 'dtkcore' 'dtkwidget' 'qt5-webengine' 'libnotify')
makedepends=('git' 'qt5-webengine' 'dtkwidget' 'libnotify')
backup=()
options=('!strip')
source_x86_64=("${url}/attach_files/772628/download/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('SKIP')
sha256sums_x86_64=('814300a12b776c7c1905160f46c6c630adfa37ddca0f724e60f986c45908fa1b')
source=("${pkgname}::git+${url}.git")

prepare() {
    cd "${srcdir}/${pkgname}"
    git checkout -b ${pkgver} ${pkgver}
}

build() {
    cd "${srcdir}/${pkgname}"
    qmake ./${pkgname}-project.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    ar -x *.deb
    tar -xf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgdir}"

    find "${pkgdir}/" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/" -type d -exec chmod 755 "{}" \;

    chmod 1777 "${pkgdir}/tmp"

    install -Dm0755 "${srcdir}/${pkgname}/build/src/${pkgname}" "${pkgdir}/opt/durapps/${pkgname}/bin/${pkgname}"
    install -dm0755 "${pkgdir}/usr/bin"
    ln -sf "/opt/durapps/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
