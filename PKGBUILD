# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: G. Schlisio <x-git@dukun.de>
# Contributor: Matt Harrison <matt@hallme.com>
# Contributor: Sergey Mamonov <mrqwer88@gmail.com>
pkgname=maldet
pkgver=1.6.4
pkgrel=7
pkgdesc="linux malware scanner designed around threats faced in shared host environments"
url="https://www.rfxn.com/projects/linux-malware-detect/"
license=('GPL2')
arch=('any')
depends=('perl')
depends_x86_64=('lib32-glibc')
source=("https://github.com/rfxn/linux-malware-detect/archive/${pkgver}.tar.gz")
backup=("etc/maldet/maldet.conf")
md5sums=('75560119b94f558da88d5f8cc8710354')

## TODO upstream setup tries to overwrite clamav's rfxn.* and lmd.user.* files
#  seems to run with root-privs, so check for overwrites anywhere (best in a VM)
#  file system privileges - depends on root/user

package(){
    cd "$srcdir/linux-malware-detect-$pkgver"
    dest="$pkgdir/usr/share/maldet"
    mkdir -p "$dest"
    cp -r files/* "$dest"
    mkdir -p "$pkgdir/usr/bin/"
    mv "$dest"/maldet "$pkgdir/usr/bin"
    sed -i "s|^inspath='/usr/local/maldetect'|inspath='/usr/share/maldet'|" "$pkgdir/usr/bin/maldet"
    sed -i 's|^intcnf="\$inspath/internals/internals.conf"|intcnf="/etc/maldet/internals.conf"|' "$pkgdir/usr/bin/maldet"

    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    sed "s|/usr/local/maldetect/maldet|/usr/bin/maldet|" "$dest/service/maldet.service" \
      | sed "s|--monitor /usr/local/maldetect/monitor_paths|--monitor /etc/maldet/monitor_paths|" \
      | sed "s|^PIDFile=.*|PIDFile=/var/lib/maldet/tmp/inotifywait.pid|" \
      | sed "s|^EnvironmentFile=.*|EnvironmentFile=/etc/maldet/maldet.conf|" \
      > "$pkgdir/usr/lib/systemd/system/maldet.service"
    rm -r "$dest/service"

    mkdir -p "$pkgdir/var/lib/maldet"
    mkdir -p "$pkgdir/var/lib/maldet/"{internals,quarantine,sess,sigs,clean,tmp,pub}
    mkdir -p "$pkgdir/var/log/maldet"
    mkdir -p "$pkgdir/etc/maldet"
    mv "$dest/conf.maldet" "$pkgdir/etc/maldet/maldet.conf"
    sed 's|^logdir="\$inspath/logs"|logdir="/var/log/maldet"|' "$dest/internals/internals.conf" \
      | sed 's|^inspath=/usr/local/maldetect|inspath="/usr/share/maldet"|' \
      | sed 's|^intcnf="$inspath/internals/internals.conf"|intcnf="/etc/maldet/internals.conf"|' \
      | sed 's|^confpath="\$inspath"|confpath="/etc/maldet"|' \
      | sed 's|^cnffile="conf.maldet"|cnffile="maldet.conf"|' \
      | sed 's|^varlibpath="\$inspath"|varlibpath="/var/lib/maldet"|' \
      | sed 's|^tmpdir="\$inspath/tmp"|tmpdir="$varlibpath/tmp"|' \
      | sed 's|^inotify_log="\$inspath/logs/inotify_log"|inotify_log="$logdir/inotify_log"|' \
      > "$pkgdir/etc/maldet/internals.conf"
    mv "$dest"/ignore_{inotify,paths,file_ext,sigs} "$pkgdir/etc/maldet/" 
    mv "$dest/monitor_paths" "$pkgdir/etc/maldet/" 

    mkdir -p "$pkgdir/usr/share/man/man1/"
    gzip -9 "$dest/maldet.1"
    mv "$dest/maldet.1.gz" "$pkgdir/usr/share/man/man1/" 
    mkdir -p "$pkgdir/usr/share/doc/maldet/"
    cp CHANGELOG COPYING.GPL README "$pkgdir/usr/share/doc/maldet/"
    rm -r "$dest/cron"
    rm "$dest/uninstall.sh"
}
