# $Id: PKGBUILD 130872 2015-04-07 09:31:38Z jsteel $
# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Greg Sutcliffe <puppet-aur (at) emeraldreverie (dot) org>
# Contributor: Hyacinthe Cartiaux <hyacinthe (dot) cartiaux (at) free (dot) fr>
# Contributor: Thomas S Hatch <thatch45 (at) Gmail (dot) com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Miah Johnson <miah (at) chia-pet dot org>
# Contributor: Dave Simons <miouhpi (at) Gmail (dot) com>
# Contributor: Niels Abspoel <aboe76 (at) Gmail (dot) com>

pkgname=puppet3
pkgver=3.8.7
pkgrel=1
pkgdesc="Server automation framework and application"
arch=('any')
url="http://puppetlabs.com/puppet/puppet-open-source"
license=('APACHE')
depends=('facter2' 'hiera')
optdepends=('ruby-shadow: user password management'
            'logrotate')
provides=("puppet=$pkgver")
conflicts=('puppet')
backup=('etc/puppet/auth.conf' 'etc/puppet/fileserver.conf'
        'etc/puppet/puppet.conf' 'etc/puppet/tagmail.conf')
install=puppet.install
source=(http://downloads.puppetlabs.com/puppet/puppet-$pkgver.tar.gz)
md5sums=('99061eb4f868a03f0d524de2af10855d')

prepare() {
  cd puppet-$pkgver

  # Ruby 2.2 fixes
  sed -i 's/: "syck"$/: (defined?(Psych) \&\& YAML == Psych ? "psych" : "syck")/' \
    lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb
}

package() {
  cd puppet-$pkgver

  ruby install.rb --destdir="$pkgdir" --sitelibdir="$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' )"

  install -Dm644 "$srcdir"/puppet-$pkgver/ext/redhat/puppet.conf \
    "$pkgdir"/etc/puppet/puppet.conf
  install -Dm644 "$srcdir"/puppet-$pkgver/ext/redhat/logrotate \
    "$pkgdir"/etc/logrotate.d/puppet
  install -Dm644 "$srcdir"/puppet-$pkgver/conf/fileserver.conf \
    "$pkgdir"/etc/puppet/fileserver.conf
  install -Dm644 "$srcdir"/puppet-$pkgver/conf/tagmail.conf \
    "$pkgdir"/etc/puppet/tagmail.conf

  install -d "$pkgdir"/{var/lib/puppet,usr/lib/tmpfiles.d}

  echo "d /var/run/puppet 0755 puppet puppet -" > \
    "$pkgdir"/usr/lib/tmpfiles.d/puppet.conf

  # systemd
  install -Dm644 "$srcdir"/puppet-$pkgver/ext/systemd/puppet.service \
    "$pkgdir"/usr/lib/systemd/system/puppet.service
  install -Dm644 "$srcdir"/puppet-$pkgver/ext/systemd/puppetmaster.service \
    "$pkgdir"/usr/lib/systemd/system/puppetmaster.service

  # vim and emacs
  install -Dm644 "$srcdir"/puppet-$pkgver/ext/vim/ftdetect/puppet.vim \
    "$pkgdir"/usr/share/vim/vimfiles/ftdetect/puppet.vim
  install -Dm644 "$srcdir"/puppet-$pkgver/ext/vim/syntax/puppet.vim \
    "$pkgdir"/usr/share/vim/vimfiles/syntax/puppet.vim
  install -Dm644 "$srcdir"/puppet-$pkgver/ext/emacs/puppet-mode.el \
    "$pkgdir"/usr/share/emacs/site-lisp/puppet-mode.el
  install -Dm644 "$srcdir"/puppet-$pkgver/ext/emacs/puppet-mode-init.el \
    "$pkgdir"/usr/share/emacs/site-lisp/site-start.d/puppet-mode-init.el

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/puppet/LICENSE
}
