# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=java-r5
_pkgname=${pkgname#java-}
pkgver=6.2
pkgrel=1

pkgdesc="Conveyal R5 Routing Engine"
url="https://github.com/conveyal/r5"
license=("MIT")

arch=("i686" "x86_64")

depends=("jdk11-openjdk")
makedepends=("gradle" "git")

source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/conveyal/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "01-don-t-try-to-guess-git-version_v6.2.patch"
    "r5-backend.service"
    "r5-backend.sysusers"

)
sha512sums=(
    "e2d3026904342c42dc7b3620a8f83f8779fc75944717d16c693eb1ebe00dc81320bdf1a4c24a70df1e76b5eabb4999bb823056239581d35b3c96f73d1020c5a2"
    "ceb669a12de7770877e6066e52bfd7103f100afc8adaf1a90fa95e6868683284623dd3b948732b8d3b3911260881a58868a21b935aa71ec9d613731728e290c6"
    "bbd8b1d60359bd1f33dd4aaf94752cdd7c338e2b46cb91e6488df4f7c27f262ffda1789d010c7621652234be72c9813601bd0775f6e77bad04b8a7ef2d1d3be7"
    "322e32156c18d323c9b62f97e2a3792c151a5f7b677b291061ea0da8697fc00cc6977dbcb3f723ea492ae339508dfb543d731fa1c4f857f7efc0e470c3d1fe09"
)

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/01-don-t-try-to-guess-git-version_v6.2.patch"
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
