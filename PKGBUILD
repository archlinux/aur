# Maintainer: taotieren <admin@taotieren.com>

pkgbase=hbdsamples-git
pkgname=(hbdsamples{,-{instrument,smart-panel,smartbox}}-git)
pkgver=r91.880b127
pkgrel=1
pkgdesc="Samples for HybridOS 2.0"
arch=(any)
url="https://github.com/HybridOS2/HBDSamples"
license=('GPL-3.0')
groups=(hybridos2-git)
replaces=()
depends=(
    hbdbus
    hbdinetd
    purc
    xguipro)
makedepends=()
checkdepends=()
optdepends=()
source=("${pkgbase%-git}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "${srcdir}/${pkgbase%-git}/"
#     git describe --long --tags | sed 's/ver.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package_hbdsamples-git() {
    depends=(hbdsamples-{instrument,smart-panel,smartbox}-git)
}

package_hbdsamples-instrument-git() {
    pkgdesc+=" (hbdsamples-instrument)"

    cd "${srcdir}/${pkgbase%-git}/"

    local _pname=${pkgname#*-}
    local _pname=${_pname%-*}

    install -dm0755 ${pkgdir}/app
    cp -rv ${_pname} ${pkgdir}/app/
    install -Dm0755 /dev/stdin ${pkgdir}/usr/bin/${pkgname%-git} << EOF
#!/usr/bin/env bash

# Please run run-xguipro manually before running this script.
# 请先手动运行 run-xguipro 后再运行此脚本

cd /app/${_pname}/

purc -c socket -v index.hvml
EOF
}

package_hbdsamples-smart-panel-git() {
    pkgdesc+=" (hbdsamples-smart-panel)"

    cd "${srcdir}/${pkgbase%-git}/"

    local _pname=${pkgname#*-}
    local _pname=${_pname%-*}

    install -dm0755 ${pkgdir}/app
    cp -rv ${_pname} ${pkgdir}/app/
    install -Dm0755 /dev/stdin ${pkgdir}/usr/bin/${pkgname%-git} << EOF
#!/usr/bin/env bash

# Please run run-xguipro manually before running this script.
# 请先手动运行 run-xguipro 后再运行此脚本

cd /app/${_pname}/

purc -c socket -v index.hvml
EOF
}

package_hbdsamples-smartbox-git() {
    pkgdesc+=" (hbdsamples-smartbox)"

    cd "${srcdir}/${pkgbase%-git}/"

    local _pname=${pkgname#*-}
    local _pname=${_pname%-*}

    install -dm0755 ${pkgdir}/app
    cp -rv ${_pname} ${pkgdir}/app/
    install -Dm0755 /dev/stdin ${pkgdir}/usr/bin/${pkgname%-git} << EOF
#!/usr/bin/env bash

# Please run run-xguipro manually before running this script.
# 请先手动运行 run-xguipro 后再运行此脚本

hbdbusd &
hbdinetd &

cd /app/${_pname}/

purc -c socket -d remote -a cn.fmsoft.hybridos.settings -r radio -v index.hvml
EOF
}
