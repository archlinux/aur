# Maintainer: agony <27015 at riseup dot net>
# Contributor: Will Handley <wh260@cam.ac.uk>

pkgname=liquidsoap
pkgver=2.4.6
pkgrel=1
pkgdesc='Swiss-army knife for multimedia streaming — scriptable live-audio engine used by Radio France, AzuraCast, Libretime'
arch=('x86_64')
url='https://www.liquidsoap.info/'
license=('GPL-2.0-or-later')
depends=(
  'glibc'
  'gcc-libs'
  'curl'
  'ffmpeg'         # HLS input, audio/video decoding (linked by build)
  'openssl'        # HTTPS sources, TLS output (linked by build)
  'libsamplerate'  # high-quality resampling (linked by build)
)
makedepends=(
  'opam'
  'ocaml'
  'dune'
  'pkgconf'
  'git'
  'unzip'
  'python'
)
install=liquidsoap.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/savonet/liquidsoap/archive/refs/tags/v${pkgver}.tar.gz"
        'liquidsoap.sysusers'
        'liquidsoap.tmpfiles')
sha256sums=('001feb5efc851f30af110b1b7892b1da02697c9282e352c603ea2b87b56273c2'
            'a8a759a71362cd405d12381effc4d41a9f70dcfb3b039b7a6236ab82e363c6d0'
            '8ea34e0054bcb937c86121abd8b230801a73ca1874ac5769708a049f699a6522')

_opam_env() {
  export HOME="${srcdir}/home"
  export DUNE_CACHE=disabled
  export OPAMROOT="${srcdir}/opam"
  export OPAMSWITCH=build
  export OPAMYES=1
  export OPAMCOLOR=never
  export OPAMNODEPEXTS=1
  export LIQUIDSOAP_BUILD_TARGET=posix
  export IS_SNAPSHOT=false
  export GIT_DIR="${srcdir}/no-git"
  mkdir -p "${HOME}"
}

prepare() {
  cd "${pkgname}-${pkgver}"

  # The four features go into depends, so opam solves them together with
  # the conflicts of liquidsoap
  sed -i -e '/^depopts: \[$/,/^\]$/{/^  "\(ffmpeg\|posix-time2\|samplerate\|ssl\)"$/d}' \
    -e 's/^depends: \[$/&\n  "ffmpeg"\n  "posix-time2"\n  "samplerate"\n  "ssl"/' \
    opam/liquidsoap.opam

  _opam_env
  opam init --bare --no-setup --disable-sandboxing
  opam switch create build ocaml-system
  opam pin add --no-action --kind=path liquidsoap-lang .
  opam pin add --no-action --kind=path liquidsoap .
  opam install --deps-only --download-only liquidsoap-lang liquidsoap
}

build() {
  cd "${pkgname}-${pkgver}"
  _opam_env
  opam install --deps-only liquidsoap-lang liquidsoap
  opam exec -- dune build -p liquidsoap-lang,liquidsoap @install
}

package() {
  cd "${pkgname}-${pkgver}"
  _opam_env
  local switch="${OPAMROOT}/${OPAMSWITCH}" stage="${srcdir}/stage" slashes
  "${switch}/bin/dune" install --prefix /usr --destdir "${stage}" liquidsoap-lang liquidsoap

  install -Dm755 "${stage}/usr/bin/liquidsoap" -t "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/liquidsoap"
  cp -r "${stage}/usr/share/liquidsoap-lang/libs" "${switch}/share/camomile" \
    "${pkgdir}/usr/share/liquidsoap/"
  install -Dm644 "${stage}/usr/share/bash_completion/completions/liquidsoap" \
    -t "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm644 "${srcdir}/liquidsoap.sysusers" "${pkgdir}/usr/lib/sysusers.d/liquidsoap.conf"
  install -Dm644 "${srcdir}/liquidsoap.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/liquidsoap.conf"

  # ctypes and camomile keep their paths in the opam switch, which liquidsoap
  # never reads; slashes of the same length overwrite them
  slashes=$(printf '%*s' "${#switch}" '' | tr ' ' /)
  LC_ALL=C sed -i -e "s|${switch}/lib/ctypes|${slashes}/lib/ctypes|g" \
    -e "s|${switch}/share/camomile|${slashes}/share/camomile|g" "${pkgdir}/usr/bin/liquidsoap"
}
