# Maintainer: devome <evinedeng@hotmail.com>

_reponame=Stirling-PDF
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-bin"
pkgver=0.45.3
pkgrel=1
pkgdesc="Locally hosted web application that allows you to perform various operations on PDF files"
arch=("any")
url="https://github.com/Stirling-Tools/${_reponame}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=("GPL-3.0-or-later")
backup=("etc/${_pkgname}/${_pkgname}.env")
depends=(
    "fontconfig"
    "java-runtime-headless>=21"
    "libreoffice"
    "pngquant"
    "poppler"
    "python-opencv"
    "python-pdf2image"
    "python-pillow"
    "python-unoserver"
    "python-weasyprint"
    "qpdf"
    "tesseract-data-eng"
)
optdepends=("jbig2enc: for certain OCR functionality")
source=("${_pkgname}-${pkgver}.jar::${url}/releases/download/v${pkgver}/${_reponame}-with-login.jar"
        "${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgname}.env"
        "${_pkgname}.service"
        "${_pkgname}.sh"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha256sums=('555544c173690a7fb57baa1dd4171687b8abf8d56257c2d7a3c913f556583606'
            'e5c1139d024b657d6c28eba020aafa2795f1edcdde8fa3a3e9920f566e6dcbaa'
            'd395992889fdf60de430509cd5866fc4606548aa1ba8f134b7e6bd4e29f293c9'
            'd717c3d0d7165f33d12e6230e2ad87f42d2fc26debe3c2a5c516d2e754c93203'
            'cc15280066c4e188edb30596fb02eabf46e5335642a4202366408cc36208e8f0'
            'efdf233d59cf82bc331e3ea85e912e7f534ed0d821674e232e3fc827f699ef43'
            '554fbc114c32f4b81fe3b8199e936881e26b5649098c495acfd4cd77eefd2612')
noextract=("${_pkgname}-${pkgver}.jar")

_langs=(afr amh ara asm aze aze_cyrl bel ben bod bos bre bul cat ceb ces chi_sim chi_sim_vert
        chi_tra chi_tra_vert chr cos cym dan dan_frak deu deu_frak div dzo ell enm epo equ
        est eus fao fas fil fin fra frk frm fry gla gle glg grc guj hat heb  hin hrv hun hye
        iku ind isl ita ita_old jav jpn jpn_vert kan kat kat_old kaz khm kir kmr kor kor_vert
        lao lat lav lit ltz mal mar mkd mlt mon mri msa mya nep nld nor oci ori osd pan pol
        por pus que ron rus san sin slk slk_frak slv snd spa spa_old sqi srp srp_latn sun swa
        swe syr tam tat tel tgk tgl tha tir ton tur uig ukr urd uzb uzb_cyrl vie yid yor)

for lang in ${_langs[@]}; do
    optdepends+=("tesseract-data-${lang}: for ${lang} language OCR")
done

package() {
    install -Dm644 "${_pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}.jar"
    install -Dm644 "${_pkgname}.env"           "${pkgdir}/etc/${_pkgname}/${_pkgname}.env"
    install -Dm644 "${_pkgname}.service"       "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm755 "${_pkgname}.sh"            "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.sysusers"      "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles"      "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    cd "${_reponame}-${pkgver}/src/main/resources"
    install -Dm644 static/fonts/*.ttf       -t "${pkgdir}/usr/share/fonts/${_pkgname}"
}
