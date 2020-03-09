# Maintainer: NebulaNeko <chfsefefgesfen foxmail>

_pkgname=qiandao
pkgname=${_pkgname}-git
pkgver=r233.380e25e
pkgrel=1
pkgdesc='一个自动签到框架 base on an HAR editor'
arch=('any')
url='https://github.com/binux/qiandao'
license=('MIT')
makedepends=('python2-setuptools' 'git')
depends=('python2-u-msgpack' 'python2-tornado=4.5.3' 'python2-jinja' 'python2-chardet' 'python2-requests' 'python2-pbkdf2' 'python2-pycrypto' 'python2-redis')
backup=('etc/qiandao.py')
source=('qiandao::git+https://github.com/binux/qiandao.git'
        '0000-change_default_database_path.patch'
        'qiandao.service'
        'sysusers.d'
        'tmpfiles.d')
sha512sums=('SKIP'
            'ff11f119b0cb8ad18a2af8c5a8ca78c7835738dc6b4c1183976c6196c4d5c8a05f04344e0bea6932d5e3d689fe9a2a0638b79addbba3a3c51479afdf3180e2e3'
            'a6156874d965e3efe24d80d2ec1f1ecedc65aa8f92ca3862bccfa4fb2926711d8b96a82ee98b8cb2523855d88954d25f859d594f4fffd15aeea451053aecb182'
            '8ddb47713d903da752a8c601df4b9cc46b3ce23ce922436f27dac9b54fb36164b1d4f2026c13f7508e56c9f2df532c7ccc2f986e5007d3a76b04d82f4a983a4c'
            '453c5a619e07d5c2d5399163d6ccf23cb56da53b29b8e6ae7fec2b63fd68c983a8cfc44b96ea344d5da686effc8cedff9795cc9b7e97bbb4e735bf65f98a97e8')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  patch -p1 -i ../0000-change_default_database_path.patch

  # python -> python2 rename
  find -type f -name '*py' -exec sed -e 's_#! \?/usr/bin/\(env \)\?python_&2_' -i {} \;
}

package() {
  install -dm755 "$pkgdir/usr/share/webapps/$_pkgname"
  cp -a $_pkgname/* "$pkgdir/usr/share/webapps/$_pkgname" 

  install -Dm644 "$_pkgname/config.py" "$pkgdir/etc/qiandao.py"
  ln -sf "/etc/qiandao.py" "$pkgdir/usr/share/webapps/$_pkgname/config.py"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/share/webapps/$_pkgname/run.py" "$pkgdir/usr/bin/qiandao"
  ln -s "/usr/share/webapps/$_pkgname/chrole.py" "$pkgdir/usr/bin/chrole"

  install -Dm644 qiandao.service "$pkgdir/usr/lib/systemd/system/qiandao.service"
  install -Dm644 tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/qiandao.conf"
  install -Dm644 sysusers.d "$pkgdir/usr/lib/sysusers.d/qiandao.conf"
}
