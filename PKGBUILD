# Maintainer: gilcu3
# Contributor: Anty0 <anty150 at gmail dot com>

pkgname='python-zulip-term-git'
_pkgname='zulip-terminal'
pkgver=0.7.0.r523.6a799870ec
pkgrel=1
pkgdesc="An interactive terminal interface for Zulip"
arch=('any')
url="https://github.com/zulip/zulip-terminal"
license=('GPL')
depends=('python'
         'python-urwid'
         'python-urwid_readline'
         'python-lxml'
         'python-beautifulsoup4'
         'python-zulip-api'
         'python-typing_extensions'
         'python-dateutil'
         'python-tzlocal'
         'python-pygments'
         'python-pytz'
         'python-pyperclip')
makedepends=('python-setuptools' 'git')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-pytest-cov')
provides=('python-zulip-term')
conflicts=('python-zulip-term')
source=('git+https://github.com/zulip/zulip-terminal#branch=main')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s" "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cd "$srcdir/$_pkgname"
  git -C . clean -dfx
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

check(){
  cd "$srcdir/$_pkgname"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Deselected tests fail due to environment changes, not package bugs:
  # - test_main_help: argparse help format changed in Python 3.13+
  # - test_soup2markup[link_*/preview-twitter]: libxml2 2.15 no longer
  #   recovers unterminated tags, so these malformed-HTML cases parse empty
  # - test_keypress_CYCLE_COMPOSE_FOCUS[tab-edit_box-...]: flaky with urwid 4
  test-env/bin/python -P -m pytest \
    --deselect 'tests/cli/test_run.py::test_main_help[-h]' \
    --deselect 'tests/cli/test_run.py::test_main_help[--help]' \
    --deselect 'tests/ui_tools/test_messages.py::TestMessageBox::test_soup2markup[link_userupload]' \
    --deselect 'tests/ui_tools/test_messages.py::TestMessageBox::test_soup2markup[link_api]' \
    --deselect 'tests/ui_tools/test_messages.py::TestMessageBox::test_soup2markup[preview-twitter]' \
    --deselect 'tests/ui_tools/test_boxes.py::TestWriteBox::test_keypress_CYCLE_COMPOSE_FOCUS[tab-edit_box-message_to_stream_name_box]'
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
