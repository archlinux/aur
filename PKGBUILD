# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protomail.com>

_pkgname=btcpayserver

pkgname=btcpayserver-git
pkgver=latest_tag
pkgrel=1
epoch=
pkgdesc="Accept Bitcoin payments. Free, open-source and self-hosted Bitcoin payment processor."
arch=("any")
url="https://github.com/btcpayserver/${_pkgname}"
license=("MIT")
groups=()
depends=("aspnet-runtime" "bitcoin-daemon" "dotnet-sdk" "lnd" "nbxplorer-git" "tmux")
makedepends=("git")
checkdepends=()
optdepends=("apache: HTTP server"
"certbot: Creates SSL certificates."
"nginx: HTTP server"
"mariadb: Database"
"postgresql: Database"
"sqlite: Database")
provides=(${_pkgname})
conflicts=("btcpayserver")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+${url}.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver()
{
    cd ${srcdir}/${_pkgname}/
    version=$(git describe --tags --abbrev=0)
    printf "%s" ${version} | sed "s/^v//;s/-/_/g;s/\//./g"
}

build()
{
    cd ${srcdir}/${_pkgname}/
    git checkout tags/$(git describe --tags --abbrev=0)
    ./build.sh
}

package()
{
    # Assure that the folders exist.
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/lib/
    mkdir -p ${pkgdir}/usr/share/doc/${_pkgname}/
    mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}/

    # Modify run.sh to state the absolute path of the .csproj.
    echo -e "#!/bin/bash
    dotnet run --no-launch-profile --no-build -c Release -p \"/usr/lib/${_pkgname}/BTCPayServer/BTCPayServer.csproj\" -- ${@}" > ${srcdir}/${_pkgname}/run.sh

    # Create btcpayserver-start.sh.
    echo -e "#!/bin/bash
    tmux new-session -s ${_pkgname} -d \"${_pkgname};bash -i\"" > ${srcdir}/${_pkgname}/${_pkgname}-start.sh

    # Create btcpayserver-stop.sh.
    echo -e "#!/bin/bash
    tmux kill-session -t ${_pkgname}" > ${srcdir}/${_pkgname}/${_pkgname}-stop.sh

    # Install the software.
    cp -r ${srcdir}/${_pkgname}/ ${pkgdir}/usr/lib/

    ## Symlinking the scripts.
    ln -sfrT ${pkgdir}/usr/lib/${_pkgname}/run.sh ${pkgdir}/usr/bin/${_pkgname}
    chmod 755 ${pkgdir}/usr/bin/${_pkgname}
    ln -sfrT ${pkgdir}/usr/lib/${_pkgname}/${_pkgname}-start.sh ${pkgdir}/usr/bin/${_pkgname}-start
    chmod 755 ${pkgdir}/usr/bin/${_pkgname}-start
    ln -sfrT ${pkgdir}/usr/lib/${_pkgname}/${_pkgname}-stop.sh ${pkgdir}/usr/bin/${_pkgname}-stop
    chmod 755 ${pkgdir}/usr/bin/${_pkgname}-stop

    # Install the documentation.
    install -Dm644 ${pkgdir}/usr/lib/${_pkgname}/README.md ${pkgdir}/usr/share/doc/${_pkgname}/

    # Install the license.
    install -Dm644 ${pkgdir}/usr/lib/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/
}
