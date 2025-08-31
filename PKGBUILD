# $Id: 469156894119f3e86346aecbb0de97fac03a04fe $
# Maintainer: Ido Rosen <ido@kernel.org>
# Contributor: Xiaoxu Guo <ftiasch0@gmail.com>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 
# From the OpenOnload website, http://www.openonload.org/ :
#   ``OpenOnload(r) is a high performance network stack from Solarflare that
#   dramatically reduces latency and cpu utilisation, and increases message rate
#   and bandwidth.  OpenOnload runs on Linux and supports TCP/UDP/IP network
#   protocols with the standard BSD sockets API, and requires no modifications
#   to applications to use. It achieves performance improvements in part by
#   performing network processing at user-level, bypassing the OS kernel
#   entirely on the data path. Networking performance is improved without
#   sacrificing the security and multiplexing functions that the OS kernel
#   normally provides.'' (10/3/2013)

# AMD/Xilinx's website seems to block certain user-agent strings. Argh.
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

pkgname='openonload'
pkgdesc="A high performance network stack from Solarflare."
epoch=1
pkgver='9.0.2.140'
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.openonload.org/'
license=('custom')
depends=("linux-lts")
makedepends=("linux-lts" "linux-lts-headers" "libarchive") # libarchive for bsdunzip
options=('libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')
source=("https://www.xilinx.com/content/dam/xilinx/publications/solarflare/onload/openonload/9_0_2_47/sf-109585-ls-47-openonload-release-package.zip"
        'openonload.install'
        'openonload.service'
	'openonload-9_0_2_140-noegrep.patch'
)
sha512sums=('227159ddd9e6236a2ecdde0464cadb411524a0a842fc615298deda1018d428fec42bc09fed23d1a89311acd379af80176569db48efc9b643dd71b1f3323f9dd5'
            '68e6ed6ea8a6f8b62dfdb291354385015c977603c8b5ee0ae321c7f0177cedb30a6abdade9c2de76bf00d88bcd095c028e1c9bd6fef535f34f0273acca1ff02c'
            'b7e4529e37c64f99c660ca9b58f388cdd8f0d2f250ba875eb210f4909bb1f1c985a065aae64c048ca6f824adc6e3176c6eae1f582c049631326db73e939edd7b'
            '835d5150284de22c956dc11526dd6ab3c379f4f1728d9a3501e7470fc8fa38ff54d29a79d3d654cc74c230520384989efd5d61b2d4034060a8c7e856e8e33fa9')

install="openonload.install"

if [[ -z "$_kernelver" ]]; then
    #_kernelver="$(uname -r)"                                      # running
    _kernelver="$(pacman -Q linux-lts | cut -d' ' -f2)-lts"        # installed
fi

prepare() {
  cd "${srcdir}/"

  tar xzf ${pkgname##open}-${pkgver}.tgz

  cd "${pkgname##open}-${pkgver}"
  patch -p1 < "${srcdir}/openonload-9_0_2_140-noegrep.patch"
}

build() {
  cd "${srcdir}/${pkgname##open}-${pkgver}"

  case $CARCH in
    "i686")
      # x86 (32 bit) build
      ./scripts/onload_build --kernelver "$_kernelver" --user32 ${DEBUG:+--debug}
    ;;
    "x86_64")
      # x64 build
      ./scripts/onload_build --kernelver "$_kernelver" ${DEBUG:+--debug}
    ;;
    *)
      # unsupported
      echo "Unsupported architecture."
      exit 1
    ;;
  esac
}

package() {
  cd "${srcdir}/${pkgname##open}-${pkgver}"

  # OpenOnload:
  install -dm755 "${pkgdir}/etc/modprobe.d"
  install -dm755 "${pkgdir}/etc/depmod.d"
  i_prefix="${pkgdir}" ./scripts/onload_install --verbose \
      --kernelver "$_kernelver" \
      --kernelmodulesdir="/usr/lib/modules" \
      --moddir="extramodules" \
      ${DEBUG:+--debug} --nobuild
  rm -f "${pkgdir}/etc/modprobe.conf" # may be created by onload_install
  mv "${pkgdir}/usr/lib64/"* "${pkgdir}/usr/lib/"
  rmdir "${pkgdir}/usr/lib64"
  mv "${pkgdir}/sbin/"* "${pkgdir}/usr/bin/"
  rmdir "${pkgdir}/sbin"
  mv "${pkgdir}/usr/sbin/"* "${pkgdir}/usr/bin/"
  rmdir "${pkgdir}/usr/sbin"

  install -Dm755 scripts/onload_install \
                                  "${pkgdir}/usr/lib/onload/onload_install"

  install -Dm644 "${srcdir}/openonload.service" \
                                  "${pkgdir}/usr/lib/systemd/system/openonload.service"

  # ef_vi libraries:
  install -dm755                  "${pkgdir}/usr/lib/"
  install -m644 build/gnu_${CARCH}/lib/ciul/libciul.so.1.1.1 \
      "${pkgdir}/usr/lib/"
  ln -s /usr/lib/libciul.so.1.1.1 ${pkgdir}/usr/lib/libciul.so.1
  ln -s /usr/lib/libciul.so.1.1.1 ${pkgdir}/usr/lib/libciul.so

  install -m644 build/gnu_${CARCH}/lib/ciul/lib{ciul,efvi}1.a \
      "${pkgdir}/usr/lib/"

  # Install documentation:
  install -dm755                  "${pkgdir}/usr/share/doc/openonload"
  install -m644 ChangeLog         "${pkgdir}/usr/share/doc/openonload"
  install -m644 LICENSE           "${pkgdir}/usr/share/doc/openonload"
  install -m644 README            "${pkgdir}/usr/share/doc/openonload"
  install -m644 README.ef_vi      "${pkgdir}/usr/share/doc/openonload"
  install -m644 ReleaseNotes      "${pkgdir}/usr/share/doc/openonload"
  install -m644 ReleaseNotes-sfc  "${pkgdir}/usr/share/doc/openonload"

  # Install ef_vi tests/samples:
  install -dm755                  "${pkgdir}/usr/share/openonload/examples"
  cp -r "src/tests/."             "${pkgdir}/usr/share/openonload/examples/."
  chmod -R a=rX                   "${pkgdir}/usr/share/openonload/examples"

  # Install LICENSE file:
  install -dm755                  "${pkgdir}/usr/share/licenses/openonload"
  ln -s "/usr/share/doc/openonload/LICENSE" \
                                  "${pkgdir}/usr/share/licenses/openonload"

}
