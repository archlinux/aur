# Maintainer: cgar <notify-cgar -AT- outlook -DOT- com>

pkgname='nkit'
pkgver='3.2.2'
pkgrel=1

_pkgname='NKit'
_gc_gh_ver='GrindCore-20261105-230'
_gc_ng_ver='0.10.0'
_projects=( 'NKitApp' 'NKDSApp' )
_dotnet_sdk='10.0'
_dotnet_runtime='linux-x64'

pkgdesc='Command line disc image tools. Convert/extract/verify/fix (nkit). Dedupe/mount (nkds).'
arch=('x86_64')
url='https://github.com/Nanook/NKit'
license=('MIT')

makedepends=("dotnet-sdk-$_dotnet_sdk")
optdepends=('nkit-ui: Graphical interface version')
options=('!strip' '!debug')
install='huge_update_notice.install'

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "${_gc_gh_ver,,}.zip::https://github.com/Nanook/GrindCore/releases/download/${_gc_gh_ver}/grindcore.zip"
)

b2sums=(
  c6189dd319b1f323d3332bbfca1661e889de7f0a055e6696f900011be3bd903af53f126ee2e8df520e4acc8747062cc8660a30ac50803e95cbfa1f704fa956e7
  82c907161dc3b3d0f9d3c2febae077de3f31a1b9817ac3d81501a0c17c37ef0b5b73d816000133240716493a4c8bc7289eefca5677bb416a8d8ad0ba9015d670
)

_dotnet_source() {
  export NUGET_PACKAGES="$srcdir/nuget-cache"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_SKIP_WORKLOAD_INTEGRITY_CHECK=1
  export DOTNET_NOLOGO=1
}

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  _dotnet_source
  for p in "${_projects[@]}"; do
    dotnet restore "$p/${p}.csproj" --runtime "$_dotnet_runtime"
  done

  cp "$srcdir/linux-x64/native/libGrindCore.a" "$NUGET_PACKAGES/grindcore/$_gc_ng_ver/runtimes/linux-x64/native/" \
    || ( error 'Adding native grindcore library to nuget cache failed, cannot continue'; return 1 )
  msg2 'Native grindcore library added to nuget cache successfuly'
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  _dotnet_source
  for p in "${_projects[@]}"; do
    dotnet publish "$p/${p}.csproj" \
      --framework "net${_dotnet_sdk}" \
      --runtime "${_dotnet_runtime}" \
      --configuration "Release" \
      --property:StripSymbols=true \
      --property:AllowUnsafeBlocks=true \
      --property:PlatformName="${_dotnet_runtime}" \
      --property:DebugSymbols=false \
      --property:DebugType=none \
      --output "publish" \
      --property:Version="$pkgver"
  done
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 'LICENSE'           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 'README.md'         "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 'RELEASE_NOTES.md'  "$pkgdir/usr/share/doc/$pkgname/RELEASE_NOTES.md"

  cd 'publish'
  install -Dm755 'nkit'  "$pkgdir/usr/bin/nkit"
  install -Dm755 'nkds'  "$pkgdir/usr/bin/nkds"

  cd 'defaults'
  install -Dm644 'nkit.yaml' "$pkgdir/usr/share/$pkgname/nkit.yaml"

  cd 'fix'
  for fix_file in *.yaml; do
    install -Dm644 "$fix_file" "$pkgdir/usr/share/$pkgname/fix/$fix_file"
  done
}
