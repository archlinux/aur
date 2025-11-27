# Maintainer: Pranit Bauva <pranit@bauva.com>
pkgname=python-databricks-agent
_pkgname=databricks-agents
pkgver=1.8.2
pkgrel=1
pkgdesc="Mosaic AI Agent Framework SDK"
arch=(any)
url="https://pypi.org/project/${_pkgname}/"
license=('custom:Databricks Proprietary License')
depends=(
  'python>=3.10'
  'python-boto3>=1'
  'python-botocore'
  'python-dataclasses-json'
  'python-httpx'
  'python-jinja>=3.0.0'
  'python-langchain-openai'
  'python-openai'
  'python-pydantic>=2'
  'python-tenacity>=8.5'
  'python-tiktoken>=0.8.0'
  'python-tqdm'
  'python-urllib3>=2.0'
)
makedepends=(python-installer)
_wheel="databricks_agents-${pkgver}-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/78/24/fc27ab4d378a3f94d4065de551202a8ef4660620e870ae086444c4a1e9a3/${_wheel}")
noextract=("${_wheel}")
sha256sums=('4957833dcd71622475a6ac9291929fd795131fda3aaebd37c9af873cf1db02dc')

package() {
  python -m installer --destdir="$pkgdir" "$srcdir/$_wheel"

  local _module=${_pkgname//-/_}
  WHEEL_PATH="$srcdir/$_wheel" \
  DISTINFO_PATH="${_module}-${pkgver}.dist-info/METADATA" \
  LICENSE_PATH="$pkgdir/usr/share/licenses/$pkgname/LICENSE" \
  python - <<'PY'
import os
import pathlib
import zipfile

wheel = pathlib.Path(os.environ['WHEEL_PATH'])
distinfo = os.environ['DISTINFO_PATH']
dest = pathlib.Path(os.environ['LICENSE_PATH'])
dest.parent.mkdir(parents=True, exist_ok=True)
with zipfile.ZipFile(wheel) as zf:
    metadata = zf.read(distinfo).decode()
marker = '# License'
if marker in metadata:
    content = marker + '\n' + metadata.split(marker, 1)[1].strip()
else:
    content = metadata
content += '\n'
dest.write_text(content, encoding='utf-8')
PY
}
