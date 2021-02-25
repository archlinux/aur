# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protomail.com>

_pkgname=NBXplorer

pkgname=nbxplorer-latest
pkgver=2
pkgrel=1
epoch=
pkgdesc="A minimalist UTXO tracker for HD wallets."
arch=("any")
url="https://github.com/dgarage/${_pkgname}"
license=("MIT")
groups=()
depends=("aspnet-runtime" "bitcoin-daemon" "dotnet-host" "dotnet-runtime" "dotnet-sdk")
makedepends=("git")
checkdepends=()
optdepends=()
provides=()
conflicts=("nbxplorer")
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
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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
    After=bitcoind.service
    After=network.target

    [Service]
    Type=oneshot
    ExecStart=/usr/bin/nbxplorer
    RemainAfterExit=yes
    Restart=on-failure

    [Install]
    WantedBy=multi-user.target" > ${srcdir}/${_pkgname}/nbxplorer.service
    
    # Put the installation at the right place.
    cp -r ${srcdir}/${_pkgname}/ ${pkgdir}/usr/lib/
    
    # Symlinking run.sh to /usr/bin/nbxplorer.
    ln -rTsf ${pkgdir}/usr/lib/${_pkgname}/run.sh ${pkgdir}/usr/bin/$(echo ${_pkgname} | tr "[A-Z]" "[a-z]")
    chmod 755 ${pkgdir}/usr/bin/$(echo ${_pkgname} | tr "[A-Z]" "[a-z]")
    
    # Install the systemd service.
    install -Dm644 ${pkgdir}/usr/lib/${_pkgname}/nbxplorer.service ${pkgdir}/usr/lib/systemd/system/
    
    # Install the documentation.
    install -Dm644 ${pkgdir}/usr/lib/${_pkgname}/README.md ${pkgdir}/usr/share/doc/${_pkgname}/
    
    # Install the license.
    install -Dm644 ${pkgdir}/usr/lib/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/
}
