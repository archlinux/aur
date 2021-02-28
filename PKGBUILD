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
depends=("aspnet-runtime" "bitcoin-cli" "bitcoin-daemon" "certbot-nginx" "dotnet-host" "dotnet-runtime" "dotnet-sdk" "lnd" "nbxplorer-git" "nginx" "sqlite")
makedepends=("git")
checkdepends=()
optdepends=()
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
    printf "%s" ${version:1}
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
    mkdir -p ${pkgdir}/usr/lib/systemd/system/
    mkdir -p ${pkgdir}/usr/share/doc/${_pkgname}/
    mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}/
    
    # Create the systemd service.
    echo -e "[Unit]
    Description=${pkgdesc}
    Requires=bitcoind.service
    Requires=nbxplorer.service
    After=bitcoind.service
    After=nbxplorer.service
    After=network.target

    [Service]
    Type=simple
    Environment=DOTNET_CLI_HOME=/tmp/
    ExecStart=/usr/bin/${_pkgname}
    Restart=on-failure

    [Install]
    WantedBy=multi-user.target" > ${srcdir}/${_pkgname}/${_pkgname}.service
    
    # Modify run.sh to state the absolute path of the .csproj.
    echo -e "#!/bin/bash
    dotnet run --no-launch-profile --no-build -c Release -p \"/usr/lib/${_pkgname}/BTCPayServer/BTCPayServer.csproj\" -- $@" > ${srcdir}/${_pkgname}/run.sh
    
    # Put the installation at the right place.
    cp -r ${srcdir}/${_pkgname}/ ${pkgdir}/usr/lib/
    
    # Symlinking run.sh to /usr/bin/${_pkgname}.
    ln -sfrT ${pkgdir}/usr/lib/${_pkgname}/run.sh ${pkgdir}/usr/bin/${_pkgname}
    chmod 755 ${pkgdir}/usr/bin/${_pkgname}
    
    # Install the systemd service.
    install -Dm644 ${pkgdir}/usr/lib/${_pkgname}/${_pkgname}.service ${pkgdir}/usr/lib/systemd/system/
    
    # Install the documentation.
    install -Dm644 ${pkgdir}/usr/lib/${_pkgname}/README.md ${pkgdir}/usr/share/doc/${_pkgname}/
    
    # Install the license.
    install -Dm644 ${pkgdir}/usr/lib/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/
}
