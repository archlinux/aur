# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=java-r5
_pkgname=${pkgname#java-}
pkgver=6.4
pkgrel=1

pkgdesc="Conveyal R5 Routing Engine"
url="https://github.com/conveyal/r5"
license=("MIT")

arch=("i686" "x86_64")

depends=("jdk11-openjdk" "java-environment")
makedepends=("gradle" "git")

source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/conveyal/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "01-don-t-try-to-guess-git-version_v6.4.patch"
    "02-path-result-max-destinations_v6.4.patch"
    "r5-backend.service"
    "r5-backend.sysusers"

)
sha512sums=(
    "fbf418570a287aaad143cc3435c01aee1bd784e686fe68aa6292f1b46416d45aaf0527d3ad5ecf056e2ac47ab529248e443aa50a8dabcd37972293b681509d45"
    "1f6468bc25d253f355792414269c099716869e7d3f5d12c079f8c24bad22616fc38a712ba33149b40642a10e45419510077d4f73abbd70b1aefcf410bf9f9f91"
    "b797e4ce01b974ea4ac2f1fc13bb99b01bea9d1f9701f3149b2eac1f193c571b4b84780892f6f95ad1302012965623266344f6fd4167cb9e6c126fc2ca4a8dd8"
    "bbd8b1d60359bd1f33dd4aaf94752cdd7c338e2b46cb91e6488df4f7c27f262ffda1789d010c7621652234be72c9813601bd0775f6e77bad04b8a7ef2d1d3be7"
    "322e32156c18d323c9b62f97e2a3792c151a5f7b677b291061ea0da8697fc00cc6977dbcb3f723ea492ae339508dfb543d731fa1c4f857f7efc0e470c3d1fe09"
)

prepare() {
    cd "${_pkgname}-${pkgver}"

    for _patch in "${srcdir}/"[0-9][0-9]-*.patch; do
        patch --forward --strip=1 --input="${_patch}"
    done

    gradle --quiet clean
}

build() {
    cd "${_pkgname}-${pkgver}"
    gradle --quiet assemble
    gradle --quiet shadowJar
}

check() {
    cd "${_pkgname}-${pkgver}"
    gradle --quiet check
}

package() {
    install \
        -Dm0644 \
        "${_pkgname}-${pkgver}/build/libs/${_pkgname}-v${pkgver}-all.jar" \
        "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}-v${pkgver}-all.jar"

    ln -s \
        "/usr/share/java/${_pkgname}/${_pkgname}-v${pkgver}-all.jar" \
        "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}-all.jar"

    install \
        -Dm0644 \
        "${_pkgname}-${pkgver}/analysis.properties.template" \
        "${pkgdir}/etc/${_pkgname}/analysis.properties"

    install \
        -Dm0644 \
        "${_pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install \
        -Dm0644 \
        r5-backend.sysusers \
        "${pkgdir}/usr/lib/sysusers.d/r5-backend.conf"

    install \
        -Dm0644 \
        r5-backend.service \
        "${pkgdir}/usr/lib/systemd/system/r5-backend.service"
}
