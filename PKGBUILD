# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-dynaconf
_pkgname=dynaconf
pkgver=3.2.13
pkgrel=1
pkgdesc='The dynamic configurator for your Python project (12-factor settings, layered envs, multiple formats)'
arch=('any')
url='https://github.com/dynaconf/dynaconf'
license=('MIT')
# dynaconf vendors all of its build-blocks (click, box, tomllib, dotenv, toml,
# ruamel) under dynaconf/vendor, so the core (and the CLI) have no hard runtime
# dependency beyond python. Every external import below lives in an optional
# loader/integration that is only imported when that feature is used.
depends=(
    'python'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
    'python-pytest-mock'
    'python-configobj'
)
optdepends=(
    'python-redis: Redis settings backend'
    'python-hvac: HashiCorp Vault settings backend'
    'python-boto3: AWS-backed Vault loader'
    'python-configobj: INI file support'
    'python-commentjson: JSON-with-comments support'
    'python-jinja: Jinja templating in setting values'
    'python-django: Django framework integration'
    'python-flask: Flask extension integration'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/dynaconf/dynaconf/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('82211b97b36eed6b2c0b8951b151d77e69110d59696afd4005e4efe7ad3880d1')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"

    # 1) upstream test suite (480 tests: all file loaders, core, CLI, validators,
    #    hooks, utils). Four files are deselected:
    #      - test_redis.py / test_vault.py need a live Redis / HashiCorp Vault.
    #      - test_django.py / test_flask.py are framework-integration tests that
    #        mutate global Django/Flask state and require the per-test process
    #        isolation dynaconf's CI runs them under (pytest-xdist); in a single
    #        process they contaminate later tests. The library itself is fully
    #        covered by the 480 that run here plus the smoke test below.
    # test_cli (runs the `dynaconf` console script) and test_inspect (reads
    # importlib.metadata.version) need the INSTALLED package, so run against the
    # built wheel in a temp prefix with its bin/ on PATH and site/ on PYTHONPATH
    # (the bare source tree only passes those if dynaconf is already installed).
    local _site
    rm -rf "$srcdir/_check"
    python -m installer --destdir="$srcdir/_check" dist/*.whl
    _site=$(python -c "import site; print(site.getsitepackages()[0])")
    PYTHONPATH="$srcdir/_check$_site:$PYTHONPATH" PATH="$srcdir/_check/usr/bin:$PATH" \
        python -m pytest tests/ \
        --ignore=tests/test_redis.py --ignore=tests/test_vault.py \
        --ignore=tests/test_django.py --ignore=tests/test_flask.py

    # 2) smoke test simulating real use: layered TOML + YAML config with an
    #    environment selected, a .env-style env-var override, and a validator,
    #    exactly as an app wires dynaconf at startup.
    PYTHONPATH="$srcdir/_check$_site:$PYTHONPATH" python - <<'PY'
import os, tempfile
os.chdir(tempfile.mkdtemp())
open('settings.toml', 'w').write('[default]\nname="demo"\nport=8080\n[production]\nport=9090\n')
open('features.yaml', 'w').write('default:\n  beta: true\nproduction:\n  beta: false\n')
os.environ['DYNACONF_PORT'] = '7777'

from dynaconf import Dynaconf, Validator
s = Dynaconf(settings_files=['settings.toml', 'features.yaml'], environments=True,
             env='production', load_dotenv=False,
             validators=[Validator('NAME', must_exist=True), Validator('PORT', gte=1)])
s.validators.validate()
assert s.NAME == 'demo', s.NAME                 # from [default]
assert s.BETA is False, s.BETA                  # production overrides default
assert int(s.PORT) == 7777, s.PORT              # env var beats the files
print('dynaconf smoke OK: name=%s port=%s beta(prod)=%s' % (s.NAME, s.PORT, s.BETA))
PY
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
