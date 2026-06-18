# Maintainer: Piotr Balwierz <his surname at google's email service>

_pkg_ver=2.7.0

pkgname=orad-bin
pkgver="${_pkg_ver}"
pkgrel=1
pkgdesc="Illumina DRAGEN ORA decompression tool (orad): converts FASTQ.ORA back to FASTQ.GZ; bundles the default human reference"
arch=('x86_64')
url=https://support.illumina.com/sequencing/sequencing_software/DRAGENORA/software-downloads.html
license=('custom:illumina')
provides=("orad=${pkgver}")
conflicts=('orad')
# orad needs only glibc + libuuid (libstdc++ is statically linked; see readelf
# NEEDED: libc/libm/libpthread/librt/libdl/ld-linux + libuuid.so.1). Max symbol
# version required is GLIBC_2.14.
depends=('glibc' 'util-linux-libs')
# Prebuilt vendor binary: don't strip or try to build a debug package from it.
options=('!strip' '!debug')

_eula=1000000139522_02_Ora_Decompression_SW_EULA.pdf
_relnotes=200057653_00_DRAGEN_ORA_Decompression_v2.7.0_Customer_Release_Notes.pdf

# The Linux installer is served, without a login gate, from Illumina's public S3
# bucket (verified by the sha256 below). The EULA / release-notes / readme PDFs
# live on the support.illumina.com CDN. The readme's upstream filename contains
# spaces, so it is fetched under a clean local name via makepkg's rename syntax.
source=(
  "https://s3.amazonaws.com/webdata.illumina.com/downloads/software/dragen-decompression/orad.${_pkg_ver}.linux.tar.gz"
  "https://support.illumina.com/content/dam/illumina-support/documents/downloads/software/dragen-decompression/${_eula}"
  "https://support.illumina.com/content/dam/illumina-support/documents/downloads/software/dragen-decompression/${_relnotes}"
  "orad-readme-v${_pkg_ver}.pdf::https://support.illumina.com/content/dam/illumina-support/documents/downloads/software/dragen-decompression/200057807_00-%20ORA%20decompression%20v2.7.0%20linux%20and%20mac%20Readme.pdf"
)
sha256sums=(
  '7a20c3cc1329598194bba032131de65aedadbde4e0f639f0d5f550e9459ff933'
  'dfebcd553b19b5c889a802f08c3bd7b727c25fb59617c7406a5abff99eb38675'
  'd12122eb455abd4e48c7214bb67219f053f83d7de3d94b7cfe5ba774e0edab50'
  '91392da7e084ed92f1cb4cf06cfdd0fb268ceefb0f9b6e85cfd985280165a1cd'
)

package() {
  cd "${srcdir}/orad.${_pkg_ver}.linux"

  # Self-contained vendor tree under /opt. orad locates its reference genome by
  # reading /proc/self/exe and searching that *real* directory for a "refbin"
  # file -- it does NOT descend into an oradata/ subdirectory for the exec-dir
  # lookup (that path is only auto-appended for $HOME). So the bundled default
  # human reference must sit directly beside the binary, not in oradata/.
  install -Dm755 orad "${pkgdir}/opt/orad/orad"
  install -Dm644 oradata/refbin "${pkgdir}/opt/orad/refbin"

  # Expose orad on PATH. /proc/self/exe resolves through this symlink to the
  # real /opt/orad/orad, so the bundled reference is still found with zero
  # configuration (no ORA_REF_PATH needed for the default human reference).
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/orad/orad "${pkgdir}/usr/bin/orad"

  # License (custom:illumina requires shipping it) + upstream documentation.
  install -Dm644 "${srcdir}/${_eula}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/${_eula}"
  install -Dm644 "${srcdir}/${_relnotes}" \
    "${pkgdir}/usr/share/doc/${pkgname}/${_relnotes}"
  install -Dm644 "${srcdir}/orad-readme-v${_pkg_ver}.pdf" \
    "${pkgdir}/usr/share/doc/${pkgname}/orad-readme-v${_pkg_ver}.pdf"
  # tiny upstream note describing the bundled reference (species + xxhash)
  install -Dm644 oradata/README \
    "${pkgdir}/usr/share/doc/${pkgname}/refbin.README"
}
