# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname=llrt-lambda-bin
pkgver=0.7.0beta
_pkgver="${pkgver//beta/-beta}" # For GitHub urls
_pkgid="$pkgname-$_pkgver" # For filenames
pkgrel=4
pkgdesc='Lightweight JavaScript runtime (BOOTSTRAP/LAYER binary for AWS Lambda, AWS SAM, and AWS CDK)'
arch=('x86_64' 'aarch64')
url='https://github.com/awslabs/llrt'
license=('Apache-2.0')
optdepends=(
  'llrt: LLRT CLI runtime, compiler, REPL, and test runner'
  'typescript: transpiler for TypeScript code with type checking support'
  'esbuild: fast compiler and bundler for JavaScript and TypeScript'
  'swc-js-bin: drop-in replacement for Babel with compilation and polyfill support'
  'bun-bin: fast runtime, compiler, and bundler for JavaScript and TypeScript'
  'aws-sam-cli: CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM'
  'aws-cdk: AWS CDK Toolkit')
provides=('llrt-lambda')
conflicts=('llrt-lambda')
source=("$_pkgid-LICENSE::https://raw.githubusercontent.com/awslabs/llrt/refs/tags/v$_pkgver/LICENSE"
        "$_pkgid-THIRD_PARTY_LICENSES::https://raw.githubusercontent.com/awslabs/llrt/refs/tags/v$_pkgver/THIRD_PARTY_LICENSES"
        "$_pkgid-NOTICE::https://raw.githubusercontent.com/awslabs/llrt/refs/tags/v$_pkgver/NOTICE")
source_x86_64=(
  "$_pkgid-x86_64-std-sdk.zip::$url/releases/download/v$_pkgver/llrt-lambda-x64.zip"
  "$_pkgid-x86_64-full-sdk.zip::$url/releases/download/v$_pkgver/llrt-lambda-x64-full-sdk.zip"
  "$_pkgid-x86_64-no-sdk.zip::$url/releases/download/v$_pkgver/llrt-lambda-x64-no-sdk.zip")
source_aarch64=(
  "$_pkgid-aarch64-std-sdk.zip::$url/releases/download/v$_pkgver/llrt-lambda-arm64.zip"
  "$_pkgid-aarch64-full-sdk.zip::$url/releases/download/v$_pkgver/llrt-lambda-arm64-full-sdk.zip"
  "$_pkgid-aarch64-no-sdk.zip::$url/releases/download/v$_pkgver/llrt-lambda-arm64-no-sdk.zip")
noextract=("${source_x86_64[@]%%::*}" "${source_aarch64[@]%%::*}")
sha256sums=('58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd'
            '8b5f4183be83b323beab34c21b68add8535c482f939b03c9557dbafb75e92e47'
            '53c5c653b7164c02212717b494d8010704cf966286b5f6a6e6d185fe8d29ceaf')
sha256sums_x86_64=('08f1fd1eb349ee0f290875db0d96605a424fc7b197103658def75fd3c41761ed'
                   'adde886660ea8110a4116723712d4b5bc5ae8f9e5efb042d591351a272a8199d'
                   '8d3a59d6eca5de8ea616e607137d051f8fb11b8158f41600b0d22cadc699c542')
sha256sums_aarch64=('487b2349c7a8fea8a568c57e60bfb32ead95d8bf7e69d36274e270b6b00efd7e'
                    '3a6fc5a24639599f4be92105790b241c45a806ef427b5add0419eea78d556ad1'
                    '6de74fe477f21034c1645bea67969be01996e54a1e9bf1c7fc7b544cd0ee1e56')

_install_llrt_bootstrap() {
  local target_suffix="$1"
  bsdtar -xf "$_pkgid-$CARCH-$target_suffix.zip" -C "$srcdir"
  install -Dm755 "$srcdir/bootstrap" "$pkgdir/usr/share/llrt/lambda/$target_suffix/bootstrap"
}

_install_licenses() {
  for file in LICENSE THIRD_PARTY_LICENSES NOTICE; do
    install -Dm644 "$srcdir/$_pkgid-$file" "$pkgdir/usr/share/licenses/$pkgname/$file"
  done
}

package() {
  _install_llrt_bootstrap "std-sdk"
  _install_llrt_bootstrap "full-sdk"
  _install_llrt_bootstrap "no-sdk"
  _install_licenses
}
