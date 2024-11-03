#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Elexis Base.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

declare -r _pkgname="elexis-3-base"
declare -r _tag="4c8f642d611e49fbdeedd0e969ef54ce704e465a"

pkgname="elexis-base"
pkgver="3.9"
pkgrel="1"
pkgdesc="Plugins for Elexis."
arch=("any")
url="https://github.com/elexis/${_pkgname}"
license=("EPL-1.0")
depends=("java-runtime>=11" "java-runtime<=17")
makedepends=("git" "java-environment>=11" "java-environment<=17" "maven")
# The git repository is needed for the build.
source=("${pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=("9e83a054879e9bdb09574325ffeb8acb968f83045974cd864dc7b64cfde6aa3e678148600464df1d5471fb82fb14ae34c760cc51aff5a7c08b13034b2c6dc175")

build()
{
    cd "${srcdir}"/"${pkgname}"/ || exit 1
    mvn -D skipTests clean verify
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/java/"${pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${pkgname}"/ch.elexis.base.p2site/target/repository/* "${pkgdir}"/usr/share/java/"${pkgname}"/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"/readme.textile "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
