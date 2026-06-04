# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-applicationinsights
_pkgname=applicationinsights
_gitname=ApplicationInsights-Python
pkgver=0.11.10
pkgrel=1
pkgdesc='Application Insights SDK for Python (telemetry for Microsoft Azure Application Insights)'
arch=('any')
url='https://github.com/Microsoft/ApplicationInsights-Python'
license=('MIT')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'git'
)
checkdepends=('python-pytest')
# applicationinsights 0.11.10 was published to PyPI without a matching git tag (the
# repo's tags are the unrelated 1.0.0b* rewrite), so pin the exact commit whose
# setup.py declares version='0.11.10'.
source=("git+https://github.com/microsoft/ApplicationInsights-Python.git#commit=a2f17aa9d7ad72c9ca5fec8b2e95d2d0f535fefc")
sha256sums=('SKIP')

build() {
    cd "$_gitname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_gitname"

    # 1) upstream test suite (unittest-style, files named Test*.py). Two modules
    #    (TestTelemetryClient/TestTelemetryProcessor) import CPython's INTERNAL
    #    `test.support`, which Arch does not ship (the stdlib `test` package is
    #    stripped) -- they cannot run here. Drop the package __init__'s force-import
    #    of the first and skip both; the remaining 16 files (channel/queue/sender/
    #    logging/requests/exception/contracts -> the wire pipeline) run fully.
    sed -i '/from \. import TestTelemetryClient/d' tests/applicationinsights_tests/__init__.py
    PYTHONPATH="$PWD:$PYTHONPATH" python -m pytest tests/applicationinsights_tests \
        --ignore=tests/applicationinsights_tests/TestTelemetryClient.py \
        --ignore=tests/applicationinsights_tests/TestTelemetryProcessor.py \
        -o python_files='Test*.py' --import-mode=importlib -q

    # 2) smoke test simulating real use: send several telemetry types through a
    #    capturing sender (no network) and assert the envelopes were enqueued with
    #    the right instrumentation key and data types.
    PYTHONPATH="$PWD:$PYTHONPATH" python - <<'PY'
from applicationinsights import TelemetryClient
from applicationinsights.channel import TelemetryChannel, SenderBase, SynchronousQueue, TelemetryContext

class CaptureSender(SenderBase):
    def __init__(self):
        super().__init__('https://dc.example.com/v2/track')
        self.sent = []
    def send(self, data_to_send):
        self.sent.extend(data_to_send)

sender = CaptureSender()
queue = SynchronousQueue(sender)
client = TelemetryClient('00000000-0000-0000-0000-000000000001',
                         telemetry_channel=TelemetryChannel(TelemetryContext(), queue))
client.track_event('checkout', {'sku': 'ABC'}, {'qty': 3})
client.track_metric('latency_ms', 42.0)
try:
    raise ValueError('boom')
except ValueError:
    client.track_exception()
client.flush()

names = [e.data.base_type for e in sender.sent]
assert 'EventData' in names and 'MetricData' in names and 'ExceptionData' in names, names
assert all(e.ikey == '00000000-0000-0000-0000-000000000001' for e in sender.sent)
print('applicationinsights smoke OK: captured', sorted(set(names)))
PY
}

package() {
    cd "$_gitname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # upstream sdist ships LICENSE.txt
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
