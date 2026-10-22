# Maintainer: Jonathan Gabor <jgabor@users.noreply.github.com>
# makepkg reads metadata and supplies srcdir/pkgdir.
# shellcheck disable=SC2034,SC2154
pkgname=unreal-engine-css-bin
pkgver=5.6.1.css83
pkgrel=5
pkgdesc='Prebuilt Coffee Stain Unreal Engine for Satisfactory mod development'
arch=('x86_64')
url='https://github.com/satisfactorymodding/UnrealEngine'
license=('LicenseRef-UnrealEngine')
# Main executable and ordinary CEF host closures, not all optional dlopen paths.
# Bash runs engine scripts; xdg-utils supplies desktop integration utilities.
# The install hook sets a default group ACL with setfacl.
depends=('glibc' 'libgcc' 'libstdc++' 'dbus' 'systemd-libs' 'bash' 'xdg-utils'
         'alsa-lib' 'at-spi2-core' 'libxcomposite' 'libxdamage' 'libxkbcommon'
         'libxrandr' 'mesa' 'nss' 'pango' 'acl')
optdepends=('vulkan-driver: run the editor'
            'glu: TechSoft CAD import')
makedepends=('github-cli' 'zstd' 'patch')
options=('!strip' '!debug' 'staticlibs')
install='unreal-engine-css-bin.install'
_release='5.6.1-css-83'
_parts=(
  "UnrealEngine-CSS-${_release}-Editor-Linux.tar.zst.00"
  "UnrealEngine-CSS-${_release}-Editor-Linux.tar.zst.01"
  "UnrealEngine-CSS-${_release}-Editor-Linux.tar.zst.02"
  "UnrealEngine-CSS-${_release}-Editor-Linux.tar.zst.03"
)
source=(
  "${_parts[0]}::ghasset://satisfactorymodding/UnrealEngine/${_release}/436454982"
  "${_parts[1]}::ghasset://satisfactorymodding/UnrealEngine/${_release}/436454971"
  "${_parts[2]}::ghasset://satisfactorymodding/UnrealEngine/${_release}/436454983"
  "${_parts[3]}::ghasset://satisfactorymodding/UnrealEngine/${_release}/436454984"
  'LICENSE.md'
  'setup-dotnet-permissions.patch'
)
noextract=("${_parts[@]}")
sha256sums=(
  '5847a80489d04e7ec231de01c154e1046174aa69f5d2c00023a62a67626001e7'
  '06e8177c34ac2cae5568a71dc92b735162ee29987e964ecf312620f0b11a8d9f'
  'b624c15b9becf336b6ed4e71b73498f208d3f6edaf857e0bcdcebce7540a9362'
  '565829545aff54f3771ac80d00e6edea38fd0a235c723c55be063f563aadb049'
  '73f98e42dbdb609f741e58725a0627dd8a0ce1122dc8aa784cc474cb41d4ddea'
  '2c3c37a79b3fbcbfde15077368ee90fabff916d60d5fae050317ead4298f466d'
)

# makepkg splits DLAGENTS on spaces, not shell quoting. Keep the helper path
# in the environment; the child Bash expands it as one quoted argument.
UNREAL_ENGINE_CSS_DOWNLOAD_HELPER="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")/download-gh-asset"
export UNREAL_ENGINE_CSS_DOWNLOAD_HELPER
DLAGENTS+=("ghasset::/usr/bin/bash -c exec\${IFS}\"\$UNREAL_ENGINE_CSS_DOWNLOAD_HELPER\"\${IFS}\"\$1\"\${IFS}\"\$2\" -- %u %o")

package() {
  local stage i
  # Repackage can skip makepkg's source checks. Always recheck the pinned
  # inputs, including the patch and notice, before consuming any archive.
  for (( i=0; i<${#source[@]}; i++ )); do
    printf '%s  %s\n' "${sha256sums[i]}" "${source[i]%%::*}"
  done | (cd "$srcdir" && sha256sum --check --strict -) || return 1

  stage=$(mktemp -d "$srcdir/engine-stage.XXXXXXXX") || return 1
  # Use pipefail only in this subshell, never in makepkg's metadata process.
  if ! (set -o pipefail
    cd "$srcdir" && cat -- "${_parts[@]}" | zstd -dc |
      tar -xf - --no-same-owner --no-same-permissions \
        --delay-directory-restore -C "$stage"
  ); then
    rm -rf -- "$stage"
    return 1
  fi
  if ! patch --batch --forward -d "$stage" -p1 < "$srcdir/setup-dotnet-permissions.patch" ||
     ! rm -rf -- "$stage/Engine/Source/Programs/LiveLinkHub" ||
     ! find "$stage" -type d -exec chmod 2775 {} + ||
     ! find "$stage" -type f -exec chmod g+w {} +; then
    rm -rf -- "$stage"
    return 1
  fi
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md" || return 1
  install -d "$pkgdir/opt" || return 1
  # makepkg clears pkgdir for package()/--repackage. Do not merge stale trees.
  [[ ! -e "$pkgdir/opt/unreal-engine-css" ]] || return 1
  # -T prohibits accidental nesting; --no-copy enforces same-filesystem staging.
  mv --no-copy -T -- "$stage" "$pkgdir/opt/unreal-engine-css"
}
