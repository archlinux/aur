# Maintainer: NebulaNeko <chfsefefgesfen foxmail>

_pkgname=pagermaid-modify
pkgname=${_pkgname}-git
pkgver=r51.f6b17bb
pkgrel=1
pkgdesc='A utility daemon for telegram.'
arch=('any')
url='https://github.com/xtaodada/PagerMaid-Modify'
depends=('python-psutil' 'python-pyqrcode' 'python-pypng' 'pyzbar' 'python-emoji'
         'youtube-dl' 'python-pyaml' 'python-redis' 'python-coloredlogs'
         'python-requests' 'python-pytz' 'python-googletrans' 'python-beautifulsoup4'
         'python-gtts' 'python-gtts-token' 'python-wordcloud' 'python-telethon'
         'python-pillow' 'python-magic' 'python-pygments' 'python-distlib'
         'speedtest-cli' 'python-gitpython' 'python-werkzeug' 'python-wtforms'
         'python-cheroot' 'python-flask' 'python-flask-sqlalchemy' 'python-flask-login'
         'python-flask-bcrypt' 'python-flask-wtf' 'python-cowpy')
backup=('etc/pagermaid.yml')
makedepends=('python-setuptools')
license=('GPL3')
source=("${_pkgname}::git+https://github.com/xtaodada/PagerMaid-Modify.git"
        "pagermaid.service"
        "0000-change-default-config-path.patch"
        "tmpfiles.d"
        "sysusers.d")
sha512sums=('SKIP'
            '03f99135e4e78c50800550d1712a7b1b6eae6f859a5db9ad96fa4d96891cd4a623742bb2c128099ba629a6874bf287aecae16ec386e34a300fe0af8a722dcec1'
            '92a02af88966dbbddc02ed86c8220fb371b2432b44550ee616b18ba792163798b5496db3397c550ff2a810d53844f69c29a5bdb16b84f568e626dfefcb6ab3dc'
            '4da217a17f26738e4704886fd9a188132768945f222ba97184c02e32dfae10dbe3082ca40f1907e8ee53e8824169d175a5188b3b5c58b0bb7bbe2e626e76c847'
            '49f26a80155505aee7299778d850fdb9437dd2f064f720e46a92b53d4bfbb56cd13d3ddb0a6fb2890113c6a1c83e70a5369d0e35dffc1f71854e2a161faa2301')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"

  patch -p1 -i ../0000-change-default-config-path.patch
  find -type f -name '*py' -exec sed -e 's/distutils2/distutils/g' -i {} \;
}

build() {
	cd "$_pkgname"
	python setup.py build

  cd ..
  tee wrapper << EOF
#!/bin/sh
python -m pagermaid
EOF
}

package() {
	cd "$_pkgname"

  echo > requirements.txt
  cp some-plugins/* pagermaid/modules/
  install -Dm644 config.gen.yml "$pkgdir/etc/pagermaid.yml"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  cd ..
  install -Dm755 wrapper "$pkgdir/usr/bin/pagermaid"
  install -Dm644 pagermaid.service "$pkgdir/usr/lib/systemd/system/pagermaid.service"

  install -Dm644 tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/pagermaid.conf"
  install -Dm644 sysusers.d "$pkgdir/usr/lib/sysusers.d/pagermaid.conf"
}
