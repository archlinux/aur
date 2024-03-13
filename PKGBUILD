#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Elexis.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

declare -r _pkgname="elexis-3-core"
declare -r _tag="29e738676684a7ef6afee57908b5e9df499b1390"

pkgname="elexis"
pkgver="3.9"
pkgrel="1"
pkgdesc="Software for medical practices."
arch=("x86_64")
url="https://github.com/elexis/${_pkgname}"
license=("EPL-1.0")
depends=("alsa-lib" "at-spi2-core" "dbus-glib" "freetype2" "java-runtime>=11" "java-runtime<=17" "libcups" "libnet" "libxcomposite" "libxkbcommon" "libxrandr" "mesa" "nss")
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
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/java/"${pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${pkgname}"/ch.elexis.core.p2site/target/products/Elexis3/linux/gtk/"${CARCH}"/* "${pkgdir}"/usr/share/java/"${pkgname}"/
    ln -s /usr/share/java/"${pkgname}"/Elexis3 "${pkgdir}"/usr/bin/"${pkgname}"

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"/readme.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
