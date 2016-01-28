# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Luca Cesari <mirshann (at) bewq (dot) org>
# Contributor: Thomas S Hatch <thatch45 (at) Gmail (dot) com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Miah Johnson <miah (at) chia-pet dot org>
# Contributor: Dave Simons <miouhpi (at) Gmail (dot) com>

_pkgname=puppet
pkgname=puppet-git
pkgver=4.3.2.r210.g6bb616d
pkgrel=1
pkgdesc="Server automation framework and application"
arch=('any')
url="http://puppetlabs.com/puppet/puppet-open-source"
license=('APACHE')
depends=('facter' 'hiera' 'logrotate' 'ruby-shadow')
provides=('puppet')
conflicts=('puppet')
backup=('etc/puppet/auth.conf' 'etc/puppet/fileserver.conf'
        'etc/puppet/puppet.conf' 'etc/puppet/tagmail.conf')
install=$_pkgname.install
source=(git://github.com/puppetlabs/puppet.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_pkgname

  git describe | sed -r 's/([^-]*-g)/r\1/;s/-/./g' 
}

prepare() {
  cd $_pkgname

  # FS#45044: fix file location
  sed -i 's_/opt/puppetlabs/puppet_/usr_' ext/systemd/puppet.service
}

package() {
  cd $_pkgname

  ruby install.rb --destdir="$pkgdir" --sitelibdir="$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' )"

  install -d "$pkgdir"/{var/lib/$_pkgname,usr/lib/tmpfiles.d}

  echo "d /run/puppetlabs 0755 $_pkgname $_pkgname -" > \
    "$pkgdir"/usr/lib/tmpfiles.d/$_pkgname.conf

  # systemd
  install -Dm644 "$srcdir"/$_pkgname/ext/systemd/$_pkgname.service \
    "$pkgdir"/usr/lib/systemd/system/$_pkgname.service

  # vim and emacs
  install -Dm644 "$srcdir"/$_pkgname/ext/vim/ftdetect/$_pkgname.vim \
    "$pkgdir"/usr/share/vim/vimfiles/ftdetect/$_pkgname.vim
  install -Dm644 "$srcdir"/$_pkgname/ext/vim/syntax/$_pkgname.vim \
    "$pkgdir"/usr/share/vim/vimfiles/syntax/$_pkgname.vim
  install -Dm644 "$srcdir"/$_pkgname/ext/emacs/$_pkgname-mode.el \
    "$pkgdir"/usr/share/emacs/site-lisp/$_pkgname-mode.el
  install -Dm644 "$srcdir"/$_pkgname/ext/emacs/$_pkgname-mode-init.el \
    "$pkgdir"/usr/share/emacs/site-lisp/site-start.d/$_pkgname-mode-init.el

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE

  # Match permissions that puppet sets when running
  chmod 775 "$pkgdir"/var/lib/puppet
  chmod 750 "$pkgdir"/var/log/puppetlabs/puppet

  rm -r "$pkgdir"/var/run
}
