# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=hunk
pkgname=hunk-bin
pkgver=0.21.1
pkgrel=2
pkgdesc="Review-first terminal diff viewer for agentic coders"
arch=('x86_64' 'aarch64')
url="https://github.com/modem-dev/hunk"
license=('MIT')
depends=('glibc' 'sh')
provides=('hunk')
conflicts=('hunk' 'hunk-git' 'hunkdiff')
options=('!strip')
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("hunkdiff-${pkgver}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/hunkdiff-linux-x64.tar.gz")
source_aarch64=("hunkdiff-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/hunkdiff-linux-arm64.tar.gz")
sha256sums=('83fee01b5d874e1a0f57be868acdb90167b15963cebc2c9b9b75a27af063f3e6')
sha256sums_x86_64=('c7d1e23ba4ffb6ca3330797e9f0c82dbada50e3cfe1b719f4194747f2cbca122')
sha256sums_aarch64=('1d31dfc382b9a4df9c045eb239ec248f61c4161dd32ec7caaab8593d55a9eca6')

latestver() {
  curl -s "https://api.github.com/repos/modem-dev/hunk/releases/latest" | \
    grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' || true
}

package() {
  local _libdir="${pkgdir}/usr/lib/hunkdiff"
  local _srcdir

  if [[ "${CARCH}" == "x86_64" ]]; then
    _srcdir="hunkdiff-linux-x64"
  elif [[ "${CARCH}" == "aarch64" ]]; then
    _srcdir="hunkdiff-linux-arm64"
  fi

  # The bundled `hunk skill path` command walks up the ancestors of the
  # binary's resolved exec path looking for `skills/<name>/SKILL.md`, so we
  # install both side-by-side under /usr/lib/hunkdiff and expose the binary
  # on PATH via a wrapper in /usr/bin.
  install -Dm755 "${_srcdir}/hunk" "${_libdir}/${_pkgname}"
  install -Dm644 "${_srcdir}/skills/hunk-review/SKILL.md" "${_libdir}/skills/hunk-review/SKILL.md"
  install -Dm644 "${_srcdir}/skills/hunk-extensions/SKILL.md" "${_libdir}/skills/hunk-extensions/SKILL.md"

  # Without HUNK_INSTALL_SOURCE the binary guesses it was installed from npm,
  # so `hunk update` tries to overwrite the pacman-owned files and every start
  # nags about new releases. Declaring pacman makes it defer to the package
  # manager and stay quiet.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<WRAPPER
#!/bin/sh
export HUNK_INSTALL_SOURCE=pacman
exec /usr/lib/hunkdiff/${_pkgname} "\$@"
WRAPPER

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
