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
sha512sums=("SKIP")

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
