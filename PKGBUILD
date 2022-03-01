# Maintainer: taotieren <admin@taotieren.com>

pkgname=crm-git
pkgver=0.1.8.r8.gd6277b1
pkgrel=1
pkgdesc="crm 是一个在终端运行的镜像管理程序，能够对 Cargo 镜像源进行简单的添加、修改、删除操作，并能帮助您快速的切换不同的 Cargo 镜像源。"
arch=('any')
url="https://github.com/wtklbm/crm"
license=('MIT' 'Apache-2.0')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
#replaces=(${pkgname})
depends=('cargo')
makedepends=('git' 'rust')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+https://ghproxy.com/https://github.com//wtklbm/crm.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
# build crm
    cd "${srcdir}/${pkgname%-git}/"
    cargo build --release
}

check() {
    cd "${srcdir}/${pkgname%-git}/"
    cargo test --release
}

package() {
# install crm
    install -Dm0755 "${srcdir}/${pkgname%-git}/target/release/${pkgname%-git}" "${pkgdir}/usr/share/${pkgname%-git}/${pkgname%-git}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" << EOF
#!/bin/env bash
cd /usr/share/${pkgname%-git}/
./${pkgname%-git} "\$@"
EOF

}
