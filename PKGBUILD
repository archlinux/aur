# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-pystac
_pkgname=pystac
pkgver=1.14.3
pkgrel=1
pkgdesc='Python library for working with SpatioTemporal Asset Catalogs (STAC)'
arch=('any')
url='https://github.com/stac-utils/pystac'
license=('Apache-2.0')
depends=(
    'python'
    'python-dateutil'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
    'python-pytest-recording'
    'python-pytest-mock'
    'python-requests-mock'
    'python-jsonschema'
    'python-referencing'
    'python-orjson'
    'python-urllib3'
    'python-jinja'
    'python-html5lib'
)
optdepends=(
    'python-orjson: faster JSON (de)serialization'
    'python-jsonschema: STAC object validation'
    'python-referencing: local JSON-schema validation'
    'python-urllib3: reading STAC objects from remote URLs'
    'python-requests: alternative remote-URL reader'
    'python-jinja: HTML rendering of STAC objects'
)
# GitHub release tarball (the PyPI sdist omits the tests/ dir + its cassettes)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/stac-utils/pystac/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('60a523096c010eb935b35b088c4539c316350509a3f05fd04520802b5d9d4e0b')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"

    # 1) upstream test suite. The network-touching tests are recorded as vcr
    #    cassettes shipped in tests/**/cassettes, so --record-mode=none replays
    #    them offline and --block-network fails loudly if anything reaches out.
    PYTHONPATH="$PWD:$PYTHONPATH" python -m pytest tests/ \
        --record-mode=none --block-network -p no:cacheprovider -q

    # 2) smoke test simulating real use: build a Catalog -> Collection -> Item
    #    hierarchy with an asset, normalize hrefs, round-trip through dict, and
    #    walk the tree back out the way a STAC consumer would.
    PYTHONPATH="$PWD:$PYTHONPATH" python - <<'PY'
import datetime, pystac

cat = pystac.Catalog(id='sensors', description='demo catalog')
sp = pystac.SpatialExtent([[-180, -90, 180, 90]])
tp = pystac.TemporalExtent([[datetime.datetime(2020, 1, 1), None]])
coll = pystac.Collection(id='landsat', description='scenes', extent=pystac.Extent(sp, tp))
cat.add_child(coll)

item = pystac.Item(id='scene-1', geometry={'type': 'Point', 'coordinates': [10, 20]},
                   bbox=[10, 20, 10, 20], datetime=datetime.datetime(2021, 6, 1), properties={})
item.add_asset('data', pystac.Asset(href='./scene-1.tif', media_type=pystac.MediaType.COG))
coll.add_item(item)

cat.normalize_hrefs('/tmp/stac')
d = cat.to_dict()
assert d['type'] == 'Catalog' and d['id'] == 'sensors', d
got = next(cat.get_items(recursive=True))
assert got.id == 'scene-1' and 'data' in got.assets, got
assert got.assets['data'].media_type == pystac.MediaType.COG
# round-trip the item through dict and back
again = pystac.Item.from_dict(item.to_dict())
assert again.id == 'scene-1' and again.bbox == [10, 20, 10, 20]
print('pystac smoke OK: catalog->collection->item with COG asset, normalized + round-tripped')
PY
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
