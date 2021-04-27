# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protomail.com>

_pkgname=NBXplorer
_pkgname_lc=$(echo ${_pkgname} | tr "[A-Z]" "[a-z]")

pkgname=nbxplorer-git
pkgver=latest_tag
pkgrel=1
epoch=
pkgdesc="A minimalist UTXO tracker for HD wallets."
arch=("any")
url="https://github.com/dgarage/${_pkgname}"
license=("MIT")
groups=()
depends=("aspnet-runtime-3.1" "bitcoin-daemon" "dotnet-sdk-3.1")
makedepends=("git")
checkdepends=()
optdepends=()
provides=(${_pkgname_lc})
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
    # Assure that the directories exist.
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/
    mkdir -p ${pkgdir}/usr/share/doc/${_pkgname}/
    mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}/

    # Modify run.sh to state the absolute path of the .csproj.
    echo -e "#!/bin/bash
dotnet run --no-launch-profile --no-build -c Release -p \"/usr/share/${_pkgname}/NBXplorer/NBXplorer.csproj\" -- \${@}" > ${srcdir}/${_pkgname}/run.sh

    # Install the software.
    cp -r ${srcdir}/${_pkgname}/ ${pkgdir}/usr/share/

    ## Symlinking the scripts.
    ln -sfrT ${pkgdir}/usr/share/${_pkgname}/run.sh ${pkgdir}/usr/bin/${_pkgname_lc}
    chmod 755 ${pkgdir}/usr/bin/${_pkgname_lc}

    # Install the documentation.
    install -Dm644 ${srcdir}/${_pkgname}/README.md ${pkgdir}/usr/share/doc/${_pkgname}/

    # Install the license.
    install -Dm644 ${srcdir}/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/
}
