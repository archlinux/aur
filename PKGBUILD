# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=azure-identity
pkgname=python-$_name
pkgver=1.27.1
pkgrel=1
_proxyver=1.0.0-dev.20260521.2
_assetstag=61e626a4a0
pkgdesc='Microsoft Azure Identity Client Library for Python'
arch=('any')
_repo='https://github.com/Azure/azure-sdk-for-python'
url="$_repo/tree/main/sdk/identity/$_name"
license=('MIT')
depends=('python'
         'python-azure-core'
         'python-cryptography'
         'python-msal'
         'python-msal-extensions'
         'python-typing_extensions')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel')
checkdepends=('python-aiohttp'
              'python-certifi'
              'python-pytest'
              'python-dotenv'
              'python-urllib3'
              'python-configargparse'
              'python-pytest-asyncio'
              'glibc'
              'libgcc'
              'libstdc++'
              'zlib'
              'icu'
              'openssl-3'
              'git')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/${_name}_$pkgver.tar.gz"
        "$_name-recordings-$_assetstag.tar.gz::https://github.com/Azure/azure-sdk-assets/archive/refs/tags/python/identity/${_name}_$_assetstag.tar.gz")
source_x86_64=("test-proxy-$_proxyver-x86_64.tar.gz::https://github.com/Azure/azure-sdk-tools/releases/download/Azure.Sdk.Tools.TestProxy_$_proxyver/test-proxy-standalone-linux-x64.tar.gz")
source_aarch64=("test-proxy-$_proxyver-aarch64.tar.gz::https://github.com/Azure/azure-sdk-tools/releases/download/Azure.Sdk.Tools.TestProxy_$_proxyver/test-proxy-standalone-linux-arm64.tar.gz")
noextract=("test-proxy-$_proxyver-x86_64.tar.gz"
           "test-proxy-$_proxyver-aarch64.tar.gz")
sha256sums=('6403af054fdc84aa73a1b992046ad81295f6ce9ff5a084f1a21b3719b2c022a5'
            '48ec0eec49e0b3312614e0faff19e1315b627466064255d13ca6bcc72a8cbd75')
sha256sums_x86_64=('ea0aa71e50fc279e511ba245d3457a9e9c8b5cce60bd58080b3e6ff48bb4cbcd')
sha256sums_aarch64=('edaf248684072b7d84c426ea5b6d20a3df96aa649280fc31452c1c2bb7effb3b')

prepare() {
  cd "azure-sdk-for-python-${_name}_$pkgver/sdk/identity/$_name"
  # Use the setuptools version shipped by Arch
  sed -i '/^requires = /s/"\([^"<>=!~]*\)[<>=!~][^"]*"/"\1"/g' pyproject.toml ../azure-identity-broker/pyproject.toml ../../../eng/tools/azure-sdk-tools/pyproject.toml
  # devtools_testutils finds the repository root through its .git folder
  mkdir ../../../.git
  # Use the test proxy from the sources instead of downloading it during the tests
  mkdir ../../../.proxy
  bsdtar -xf "$srcdir"/test-proxy-$_proxyver-$CARCH.tar.gz -C ../../../.proxy
  echo "$_proxyver" > ../../../.proxy/downloaded_version.txt
  # Use the recordings from the sources instead of restoring them with git during the tests
  rm assets.json
  cp -r "$srcdir"/azure-sdk-assets-python-identity-${_name}_$_assetstag/python/sdk/identity/$_name/tests/recordings tests/
}

build() {
  cd "azure-sdk-for-python-${_name}_$pkgver/sdk/identity/$_name"
  python -m build --wheel --no-isolation
  python -m build --wheel --no-isolation ../azure-identity-broker
  python -m build --wheel --no-isolation ../../../eng/tools/azure-sdk-tools
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "azure-sdk-for-python-${_name}_$pkgver/sdk/identity/$_name"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer ../azure-identity-broker/dist/*.whl
  test-env/bin/python -m installer ../../../eng/tools/azure-sdk-tools/dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "azure-sdk-for-python-${_name}_$pkgver/sdk/identity/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
