#Maintainer: Musikolo<musikolo {at} hotmail [dot] com>
#Contributor: Martin špelina<shpelda [at]gmail[dot]com>
pkgname=dbvis
pkgver=9.5.6
__pkgver_underscore=9_5_6
pkgrel=1
pkgdesc="DbVisualizer free - The Universal Database Tool"
url="http://www.dbvis.com/"
license=('custom')
arch=('any')
depends=('java-runtime')
makedepends=(coreutils sed grep unzip)
source=('http://www.dbvis.com/product_download/'$pkgname'-'$pkgver'/media/'$pkgname'_unix_'$__pkgver_underscore'.tar.gz')
sha256sums=('28d5ff0dbb73a1f2354cd889eef04bc4604acb54728b74b4b471f8c2c14a1790')

package() {
  __dbvis_lib=/usr/share/java/$pkgname
  __dbvis_doc=/usr/share/doc/$pkgname
  __dbvis_etc=/etc/$pkgname
  __dbvis_gui_launch=/usr/bin/dbvisgui
  __dbvis_cmd_launch=/usr/bin/dbviscmd
  __dbvis_desktop=/usr/share/applications/dbvis.desktop
  __dbvis_icon=/usr/share/icons/hicolor/@@RESOLUTION@@/apps/$pkgname.png;
  mkdir -p $pkgdir/$__dbvis_lib
  mkdir -p $pkgdir/$__dbvis_doc
  mkdir -p $pkgdir/$__dbvis_etc
  mkdir -p $pkgdir/`dirname $__dbvis_gui_launch`
  mkdir -p $pkgdir/`dirname $__dbvis_cmd_launch`
  cd $srcdir/DbVisualizer
  cp lib/* $pkgdir/$__dbvis_lib
  #drivers should have their own packages
  cp -r jdbc $pkgdir/$__dbvis_lib
  cp -r doc/* $pkgdir/$__dbvis_doc
  cp -r resources/* $pkgdir/etc/$pkgname
  #symlinks are bad, but..
  ln -s $pkgdir/$__dbvis_doc $pkgdir/$__dbvis_lib/doc
  #make a launch scripts
  echo "#!/bin/bash" > $pkgdir/$__dbvis_gui_launch
  cat dbvisgui.sh |\
     grep "CP="|\
     sed -e 's|$DBVIS_HOME/resources|'$__dbvis_etc'|g'|\
     sed -e 's|$CP:$DBVIS_HOME/lib|$CP:'$__dbvis_lib'|g' >>\
     $pkgdir/$__dbvis_gui_launch
  cat dbvisgui.sh |\
     grep "\$JAVA_EXEC" |\
     sed -e 's|$JAVA_EXEC|java|g' |\
     sed -e 's|$DBVIS_HOME|'$__dbvis_lib'|g'>>\
     $pkgdir/$__dbvis_gui_launch
  chmod 755 $pkgdir/$__dbvis_gui_launch

  echo "#!/bin/bash" > $pkgdir/$__dbvis_cmd_launch
  cat dbviscmd.sh |\
     grep "CP="|\
     sed -e 's|$DBVIS_HOME/resources|'$__dbvis_etc'|g'|\
     sed -e 's|$CP:$DBVIS_HOME/lib|$CP:'$__dbvis_lib'|g' >>\
     $pkgdir/$__dbvis_cmd_launch
  cat dbviscmd.sh |\
     grep "\$JAVA_EXEC" |\
     sed -e 's|$JAVA_EXEC|java|g' |\
     sed -e 's|$DBVIS_HOME|'$__dbvis_lib'|g'>>\
     $pkgdir/$__dbvis_cmd_launch
  chmod 755 $pkgdir/$__dbvis_cmd_launch

  #install icons
  __dbvis_temp=/tmp/dbvis.pkgbuild.$$ 
  unzip -o -j lib/dbvis.jar "images/ix3/dbvis-icon*.png" -d $__dbvis_temp
  rm $__dbvis_temp/{*@2x.png,*white.png}
  for i in $__dbvis_temp/*;do
    __dbvis_icon_source=`basename $i`
    __dbvis_icon_resolution=`echo $__dbvis_icon_source | sed 's/.*dbvis-icon\([^.]*\)\.png/\1/g'`;
    __dbvis_icon_resolved=`echo $__dbvis_icon | sed 's/@@RESOLUTION@@/'$__dbvis_icon_resolution'/g'`
    mkdir -p `dirname $pkgdir/$__dbvis_icon_resolved`;
    mv $i $pkgdir/$__dbvis_icon_resolved
    chmod 644 $pkgdir/$__dbvis_icon_resolved
  done;
  rm -rf $__dbvis_temp

  #create a .desktop file
  mkdir -p `dirname $pkgdir/$__dbvis_desktop`
  echo "[Desktop Entry]"  >  $pkgdir/$__dbvis_desktop
  echo "Type=Application" >> $pkgdir/$__dbvis_desktop
  echo "Name=DbVisualizer" >> $pkgdir/$__dbvis_desktop
  echo "Version=$pkgver" >> $pkgdir/$__dbvis_desktop
  echo "GenericName=The Universal Database Tool" >> $pkgdir/$__dbvis_desktop
  echo "Comment=$pkgdesc" >> $pkgdir/$__dbvis_desktop
  echo "Exec="$__dbvis_gui_launch >> $pkgdir/$__dbvis_desktop
  echo "Icon="$pkgname >> $pkgdir/$__dbvis_desktop
  echo "Terminal=false" >> $pkgdir/$__dbvis_desktop
  echo "Categories=Development" >> $pkgdir/$__dbvis_desktop

  #Fix error [DEBUG ExecutorRunner-pool-1-thread-1 J.ā] Could not load profile mysql from /usr/share/java/dbvis/resources/profiles/mysql.xml. File not found
  mkdir -p $pkgdir/$__dbvis_lib/resources
  ln -s $__dbvis_etc/profiles $pkgdir/$__dbvis_lib/resources/profiles
}
