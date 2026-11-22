# Maintainer: agony <27015 at riseup dot net>
# Contributor: Will Handley <wh260@cam.ac.uk>

pkgname=liquidsoap
pkgver=2.5.0rc2
pkgrel=1
pkgdesc='Audio and video streaming language'
arch=('x86_64')
url='https://www.liquidsoap.info/'
license=('GPL-2.0-or-later')
depends=('curl' 'ffmpeg' 'glibc' 'libsamplerate' 'openssl')
makedepends=('git' 'opam' 'pandoc-cli' 'unzip')
optdepends=('bubblewrap: sandbox for external processes')
install=liquidsoap.install
_ver=${pkgver/rc/-rc}
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/savonet/liquidsoap/archive/refs/tags/v${_ver}.tar.gz"
        'liquidsoap.sysusers'
        'liquidsoap.tmpfiles')
sha256sums=('2cbdfa5e3e43cfa81b25ddf9b85a166a9a8c2cbc02ae2b9a2f4e9e6096fb91a8'
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
  cd "${pkgname}-${_ver}"
  sed -i "s/@version@/${_ver}/" doc/liquidsoap.1.md

  # The ssl and posix-time2 features go into depends, so opam solves them
  # together with the conflicts of liquidsoap
  sed -i -e '/^depopts: \[$/,/^\]$/{/^  "\(posix-time2\|ssl\)"$/d}' \
    -e 's/^depends: \[$/&\n  "posix-time2"\n  "ssl"/' opam/liquidsoap.opam

  _opam_env
  opam init --bare --no-setup --disable-sandboxing
  # duppy needs OCaml 5.5.2 or later, and Arch has 5.5.0
  opam switch create build --empty
  opam switch set-invariant --no-action ocaml-base-compiler.5.5.2
  opam pin add --no-action --kind=path liquidsoap-lang .
  opam pin add --no-action --kind=path liquidsoap .
  opam pin add --no-action --kind=path duppy .
  opam install --deps-only --download-only liquidsoap-lang liquidsoap duppy
}

build() {
  cd "${pkgname}-${_ver}"
  _opam_env
  opam install --deps-only liquidsoap-lang liquidsoap duppy
  # The FFmpeg and libsamplerate bindings build from src/modules/synced, as in
  # the upstream deb: liquidsoap needs ffmpeg 2.0.0, which opam does not have
  local synced=samplerate,ffmpeg-avutil,ffmpeg-avcodec,ffmpeg-av,ffmpeg-avfilter,ffmpeg-avdevice,ffmpeg-swscale,ffmpeg-swresample
  opam exec -- dune build -p "liquidsoap-lang,liquidsoap,duppy,${synced}" @install
}

package() {
  cd "${pkgname}-${_ver}"
  _opam_env
  local switch="${OPAMROOT}/${OPAMSWITCH}" stage="${srcdir}/stage" slashes
  PATH="${switch}/bin:${PATH}" "${switch}/bin/dune" install --prefix /usr \
    --destdir "${stage}" --docdir /usr/share/doc --mandir /usr/share/man \
    liquidsoap-lang liquidsoap

  install -Dm755 "${stage}/usr/bin/liquidsoap" -t "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/liquidsoap" "${pkgdir}/usr/share/doc"
  cp -r "${stage}/usr/share/liquidsoap-lang/libs" "${pkgdir}/usr/share/liquidsoap/"
  cp -r "${stage}/usr/share/doc/liquidsoap" "${pkgdir}/usr/share/doc/"
  install -Dm644 "${stage}/usr/share/man/man1/liquidsoap.1" -t "${pkgdir}/usr/share/man/man1/"
  install -Dm644 "${stage}/usr/share/bash_completion/completions/liquidsoap" \
    -t "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm644 "${srcdir}/liquidsoap.sysusers" "${pkgdir}/usr/lib/sysusers.d/liquidsoap.conf"
  install -Dm644 "${srcdir}/liquidsoap.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/liquidsoap.conf"

  # posix-base, camomile and dune-site keep paths of the opam switch, which
  # liquidsoap never reads; slashes of the same length overwrite them
  slashes=$(printf '%*s' "${#switch}" '' | tr ' ' /)
  LC_ALL=C sed -i "s|${switch}|${slashes}|g" "${pkgdir}/usr/bin/liquidsoap"
}
