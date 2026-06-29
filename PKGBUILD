# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=iptvorg-epg-git
_pkgname=iptvorg-epg
pkgver=2026.06.27.g148cbabaf
pkgrel=1
pkgdesc="Utilities for downloading the Electronic Program Guide for thousands of TV channels from hundreds of sources (git version)"
arch=('x86_64')
url="https://github.com/iptv-org/epg"
license=('Unlicense')
depends=('bash' 'libxml2' 'nodejs>=22' 'npm')
makedepends=('git' 'jq')
optdepends=('noto-fonts-emoji: compatibility with printsites option')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug')
source=("${pkgname}::git+https://github.com/iptv-org/epg.git"
        "${_pkgname}.sh"
        "my.channels.xml")
sha256sums=('SKIP'
            'ea49cfc82fedc08a5d8c054a47fc3fb30182c235c297556e8b66e551f6b04dc0'
            '26e87976d170c78e458ac44e65d305374aef67d2ab44a17bce151e86a2b783e5')

pkgver() {
  cd "${srcdir}/${pkgname}"
  local _date
  _date="$(git log -1 --format='%cd' --date='format:%Y.%m.%d' 2>/dev/null || echo "${pkgver}")"
  local _sha
  _sha="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"
  echo "${_date}.g${_sha}"
}

build() {
  cd "${srcdir}/${pkgname}"

  # Install npm dependencies with isolated cache per Node.js guidelines
  npm ci --cache "${srcdir}/npm-cache" 2>&1 || npm install --cache "${srcdir}/npm-cache" 2>&1

  # Remove platform-specific native binaries for other architectures.
  # Keep only linux-x64; remove all others.
  for _esdir in node_modules/@esbuild/linux-*/; do
    case "${_esdir}" in
      *linux-x64/) ;;
      *) rm -rf "${_esdir}" 2>/dev/null ;;
    esac
  done
  rm -rf node_modules/@esbuild/darwin-* 2>/dev/null
  rm -rf node_modules/@esbuild/freebsd-* 2>/dev/null
  rm -rf node_modules/@esbuild/openbsd-* 2>/dev/null
  rm -rf node_modules/@esbuild/win32-* 2>/dev/null
  rm -rf node_modules/@esbuild/netbsd-* 2>/dev/null
  rm -rf node_modules/@esbuild/android-* 2>/dev/null

  # Remove musl variants (Arch uses glibc)
  rm -rf node_modules/@swc/core-linux-x64-musl 2>/dev/null
  rm -rf node_modules/@unrs/resolver-binding-linux-x64-musl 2>/dev/null
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install the shell wrapper
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # Copy project files using --no-preserve=links to avoid namcap
  # cross-directory hardlink warnings from npm bundles (e.g. esbuild).
  # This still preserves permissions, timestamps, and symlinks.
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r --no-preserve=links . "${pkgdir}/usr/share/${pkgname}/"

  # Install sample channels file
  install -Dm644 "${srcdir}/my.channels.xml" "${pkgdir}/usr/share/${pkgname}/my.channels.xml"

  # Remove git history and other unnecessary files
  rm -rf "${pkgdir}/usr/share/${pkgname}/.git"
  rm -rf "${pkgdir}/usr/share/${pkgname}/.husky"
  rm -rf "${pkgdir}/usr/share/${pkgname}/tests"
  rm -f "${pkgdir}/usr/share/${pkgname}/.gitignore"
  rm -f "${pkgdir}/usr/share/${pkgname}/.prettierrc.js"
  rm -f "${pkgdir}/usr/share/${pkgname}/eslint.config.mjs"
  rm -f "${pkgdir}/usr/share/${pkgname}/Dockerfile"
  rm -f "${pkgdir}/usr/share/${pkgname}/workers.txt"

  # Remove npm cache that may have been copied over
  rm -rf "${pkgdir}/usr/share/${pkgname}/npm-cache"

  # Per Node.js package guidelines:
  # Remove _where references from dependency package.json files
  find "${pkgdir}" -name "package.json" -print0 | xargs -r -0 sed -i '/_where/d' 2>/dev/null

  # Clean underscored properties from the main package.json
  local main_pkgjson="${pkgdir}/usr/share/${pkgname}/package.json"
  if [[ -f "$main_pkgjson" ]]; then
    jq '. |= with_entries(select(.key | test("^_") | not))' "$main_pkgjson" \
      > "${main_pkgjson}.tmp" && mv "${main_pkgjson}.tmp" "$main_pkgjson"
    chmod 644 "$main_pkgjson"
  fi
}
