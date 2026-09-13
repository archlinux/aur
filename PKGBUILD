# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-pystac
_pkgname=pystac
pkgver=1.15.2
pkgrel=1
pkgdesc='Python library for working with SpatioTemporal Asset Catalogs (STAC)'
arch=('any')
url='https://github.com/stac-utils/pystac'
license=('Apache-2.0')
depends=(
    'python'
    'python-dateutil>=2.7'
)
makedepends=(
    'python-build'
    'python-hatchling'
    'python-installer'
)
checkdepends=(
    'python-html5lib'
    'python-jsonschema'
    'python-orjson'
    'python-pytest'
    'python-pytest-mock'
    'python-pytest-recording'
    'python-referencing'
    'python-requests-mock'
    'python-urllib3'
    'python-jinja'
)
optdepends=(
    # Arch's python-jinja carries epoch 1; encode the upstream <4 bound in
    # Arch version syntax so the current 1:3.x package actually satisfies it.
    'python-jinja<1:4: HTML rendering of STAC objects'
    'python-jsonschema>=4.18: STAC object validation'
    'python-orjson>=3.5: faster JSON (de)serialization'
    'python-referencing: local JSON-schema validation'
    'python-urllib3>=2.6.3: reading STAC objects from remote URLs'
)
# Since 1.15, upstream publishes the core and each extension as separate Python
# distributions. They all contribute to the same pystac package namespace and
# are bundled here so python-pystac remains a complete, installable package.
provides=(
    'python-pystac-core=1.15.2'
    'python-pystac-ext-classification=2.0.0'
    'python-pystac-ext-datacube=2.2.0'
    'python-pystac-ext-eo=1.1.0'
    'python-pystac-ext-file=2.1.0'
    'python-pystac-ext-grid=1.1.0'
    'python-pystac-ext-item-assets=1.0.0'
    'python-pystac-ext-label=1.0.1'
    'python-pystac-ext-mgrs=1.0.0'
    'python-pystac-ext-mlm=1.4.0'
    'python-pystac-ext-pointcloud=1.0.0'
    'python-pystac-ext-projection=2.0.0'
    'python-pystac-ext-raster=1.1.0'
    'python-pystac-ext-render=2.0.0'
    'python-pystac-ext-sar=1.0.0'
    'python-pystac-ext-sat=1.0.0'
    'python-pystac-ext-scientific=1.0.0'
    'python-pystac-ext-storage=2.0.0'
    'python-pystac-ext-table=1.2.0'
    'python-pystac-ext-timestamps=1.1.0'
    'python-pystac-ext-version=1.2.0'
    'python-pystac-ext-view=1.0.0'
    'python-pystac-ext-xarray-assets=1.0.0'
)
conflicts=(
    'python-pystac-core'
    'python-pystac-ext-classification'
    'python-pystac-ext-datacube'
    'python-pystac-ext-eo'
    'python-pystac-ext-file'
    'python-pystac-ext-grid'
    'python-pystac-ext-item-assets'
    'python-pystac-ext-label'
    'python-pystac-ext-mgrs'
    'python-pystac-ext-mlm'
    'python-pystac-ext-pointcloud'
    'python-pystac-ext-projection'
    'python-pystac-ext-raster'
    'python-pystac-ext-render'
    'python-pystac-ext-sar'
    'python-pystac-ext-sat'
    'python-pystac-ext-scientific'
    'python-pystac-ext-storage'
    'python-pystac-ext-table'
    'python-pystac-ext-timestamps'
    'python-pystac-ext-version'
    'python-pystac-ext-view'
    'python-pystac-ext-xarray-assets'
)
# GitHub release tarball (the PyPI sdist omits the tests/ dir + its cassettes)
source=(
    "$_pkgname-$pkgver.tar.gz::https://github.com/stac-utils/pystac/archive/refs/tags/v$pkgver.tar.gz"
    'python-3.14-http-error-cleanup.patch'
)
sha256sums=(
    'ea0538dc34356d3f3538a7d4114f9692017a688ed0b0cab3e1b43dc39c6908c7'
    'b82504d06f1992b00b60cca645072c32ed33503b7f67fb42961baa855c5982b7'
)

prepare() {
    cd "$_pkgname-$pkgver"
    # urllib.error.HTTPError owns a file-like object on Python 3.14. Creating
    # one only as a status sentinel leaks it and turns ResourceWarning into a
    # test/runtime failure. Preserve the public generic exception directly.
    patch -Np1 -i "$srcdir/python-3.14-http-error-cleanup.patch"
}

build() {
    cd "$_pkgname-$pkgver"

    # Build the metadata-only pystac wheel, its core, every extension wheel,
    # and the upstream test-fixture plugin used only by check().
    python -m build --wheel --no-isolation
    local component
    for component in core extensions/* pytest-pystac; do
        (
            cd "$component"
            python -m build --wheel --no-isolation
        )
    done
}

check() {
    cd "$_pkgname-$pkgver"

    local checkdir="$srcdir/check-pystac"
    local component
    local site
    local wheel
    local testpaths=(tests)
    rm -rf "$checkdir"

    # Assemble all product wheels and the upstream pytest fixture plugin into
    # an isolated staging tree. Source directories cannot satisfy imports.
    for wheel in dist/*.whl core/dist/*.whl; do
        python -m installer --destdir="$checkdir" "$wheel"
    done
    site=$(python -c 'import site; print(site.getsitepackages()[0])')
    for wheel in extensions/*/dist/*.whl; do
        # Every extension wheel contains the same empty PEP 561 marker.
        rm -f "$checkdir$site/pystac/extensions/py.typed"
        python -m installer --destdir="$checkdir" "$wheel"
    done
    python -m installer --destdir="$checkdir" pytest-pystac/dist/*.whl

    for component in extensions/*; do
        if [[ -d "$component/tests" ]]; then
            testpaths+=("$component/tests")
        fi
    done

    PYSTAC_STAGED_SITE="$checkdir$site" \
        PYTHONPATH="$checkdir$site" \
        python - <<'PY'
import os
from pathlib import Path

import pystac

module_path = Path(pystac.__file__).resolve()
staged_site = Path(os.environ["PYSTAC_STAGED_SITE"]).resolve()
assert module_path.is_relative_to(staged_site), (module_path, staged_site)
PY

    # Run the complete core and extension suites. Remote interactions are
    # replayed exclusively from the cassettes shipped in the release archive.
    PYTHONPATH="$checkdir$site" python -m pytest \
        --import-mode=importlib --record-mode=none --block-network \
        -p no:cacheprovider -p no:randomly -q "${testpaths[@]}"

    # Exercise the assembled namespace: every published extension must import,
    # then a catalog hierarchy is validated, saved, loaded, and round-tripped.
    PYTHONPATH="$checkdir$site" python - <<'PY'
import datetime
import importlib
from importlib.metadata import version
from pathlib import Path
from tempfile import TemporaryDirectory

import pystac

extensions = (
    "classification", "datacube", "eo", "file", "grid", "item_assets",
    "label", "mgrs", "mlm", "pointcloud", "projection", "raster", "render",
    "sar", "sat", "scientific", "storage", "table", "timestamps", "version",
    "view", "xarray_assets",
)
for extension in extensions:
    importlib.import_module(f"pystac.extensions.{extension}")

assert version("pystac") == "1.15.2"
assert version("pystac-core") == "1.15.2"

utc = datetime.timezone.utc
cat = pystac.Catalog(id="sensors", description="demo catalog")
sp = pystac.SpatialExtent([[-180, -90, 180, 90]])
tp = pystac.TemporalExtent([[datetime.datetime(2020, 1, 1, tzinfo=utc), None]])
coll = pystac.Collection(
    id="landsat",
    description="scenes",
    extent=pystac.Extent(sp, tp),
)
cat.add_child(coll)

item = pystac.Item(
    id="scene-1",
    geometry={"type": "Point", "coordinates": [10, 20]},
    bbox=[10, 20, 10, 20],
    datetime=datetime.datetime(2021, 6, 1, tzinfo=utc),
    properties={},
)
item.add_asset(
    "data",
    pystac.Asset(href="./scene-1.tif", media_type=pystac.MediaType.COG),
)
coll.add_item(item)

with TemporaryDirectory() as directory:
    cat.normalize_and_save(
        root_href=directory,
        catalog_type=pystac.CatalogType.SELF_CONTAINED,
    )
    loaded = pystac.Catalog.from_file(Path(directory, "catalog.json"))
    got = next(loaded.get_items(recursive=True))
    assert got.id == "scene-1" and "data" in got.assets
    assert got.assets["data"].media_type == pystac.MediaType.COG
    assert got.validate()

again = pystac.Item.from_dict(item.to_dict())
assert again.id == "scene-1" and again.bbox == [10, 20, 10, 20]
PY
}

package() {
    cd "$_pkgname-$pkgver"

    local site
    local wheel
    for wheel in dist/*.whl core/dist/*.whl; do
        python -m installer --destdir="$pkgdir" "$wheel"
    done
    site=$(python -c 'import site; print(site.getsitepackages()[0])')
    for wheel in extensions/*/dist/*.whl; do
        # All extension wheels ship the same empty PEP 561 marker.
        rm -f "$pkgdir$site/pystac/extensions/py.typed"
        python -m installer --destdir="$pkgdir" "$wheel"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
