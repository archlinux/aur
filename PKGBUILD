#
# Maintainer: Tung Ha <tunght13488 [at] gmail [dot] com>
# Contributor: Michael Rynn <michael.rynn@parracan.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <arch aur at jonw dot org>
# Contributor: Thore Bödecker <me [at] foxxx0 [dot] de>
#
# Credit to all other past PHP version AUR packages

php_suffix="71" # This mutation
php_version="7.1"
php_ext="xdebug"
pkgname="php${php_suffix}-${php_ext}"
pkgver="2.6.0"
pkgrel=1


pkgdesc="PHP extension module that aids debugging and profiling"
arch=('i686' 'x86_64')
url="http://www.xdebug.org"
license=('GPL')
depends=('php>=7.1.0' 'php<7.2.0')

pkg_src="${php_ext}-${pkgver}"

source=("https://www.xdebug.org/files/${pkg_src}.tgz"  'xdebug.ini')

sha256sums=('b5264cc03bf68fcbb04b97229f96dca505d7b87ec2fb3bd4249896783d29cbdc'
            '7c66883dc2ade69069ef84e30188b25630748aa9c8b0dd123727c00505421205')


# locate php-config[suffix], get options
# xdebug build uses phpize[suffix]

php_select()
{
    declare -a php_configy # paths


    # pass a folder to be searched for any php-config*
    findconfig()
    {
      local _myglob="$1/php-config${php_suffix}*"
      for f in $_myglob;
      do
        if [ "$f" != "$_myglob" ]; then
          php_configy+=("$f")
        fi
      done
    }

    binpath="${PATH}"

    re='([^:]+):(.*)'
    while [[ $binpath =~ $re ]]
    do
      bindir="${BASH_REMATCH[1]}"
      binpath="${BASH_REMATCH[2]}"
      findconfig $bindir
    done
    if [[ -n $binpath ]]; then
      findconfig $binpath
    fi

    # see how many we have
    optct="${#php_configy[@]}"

    # if only one, do automatic??
    if [[ $optct -lt "1" ]]; then
        echo "No php-config* found"
        exit -1
    elif [[ $optct -eq "1" ]]; then
        php_config="${php_configy[0]}"
    else
      declare -a php_options # assemble user menu
      optct=0
      php_options+=("0) Get me out of here!")
      for cfg in "${php_configy[@]}";
      do
        let optct='((optct+1))'
        PHP_FULL_VERSION=`${cfg} --version`
        php_options+=("${optct}) ${cfg}  (php-${PHP_FULL_VERSION})")
      done
      echo
      echo "More than one php-config found. Select:"
      echo
      for opt in "${php_options[@]}"; do
        echo $opt
      done
      echo
      read -p "Which php-config do you want? " choice
      numbers='[0-9]+$'
      if ! [[ "${choice}" =~ $numbers ]]; then
        echo "bye"
        exit
      fi
      if [[ ( "${choice}" -gt "$optct" ) || ( "${choice}" -lt  "1" ) ]]; then
        echo "OK"
        exit
      fi
      let choice='((choice-1))'
      php_config="${php_configy[$choice]}"
    fi

    #get some config options,  assumable from php70
    all_options=`${php_config} --configure-options`

    declare -A config_options # AA for key lookup
    attre='--([^=]+)=(.*)'
    for option in $all_options; do
        [[ $option =~ $attre ]] && vname="${BASH_REMATCH[1]}" && nvalue="${BASH_REMATCH[2]}"
        config_options[$vname]=$nvalue
    done

    # export so makepkg remembers. PHP-build dependent
    export PHPCONFIG_SCANDIR="${config_options[with-config-file-scan-dir]#/*}"
    export PHPIZE_CMD="phpize${config_options[program-suffix]}"
    export PHPCONFIG_CMD="${php_config}"

}

prepare()
{
    echo "PHPIZE path is ${PHPIZE_CMD}"
    echo "PHP scan directory is $PHPCONFIG_SCANDIR"
}
build() {
  cd "$srcdir"/$pkg_src
  "$PHPIZE_CMD"
  echo "Using php-config=${PHPCONFIG_CMD}"
  ./configure --prefix=/usr --enable-xdebug --with-php-config="${PHPCONFIG_CMD}"
  make

  cd "$srcdir"/$pkg_src/debugclient
  ./configure --prefix=/usr --program-suffix="$_pkg_suffix"
  make
}

package() {
  backup=("${PHPCONFIG_SCANDIR}/xdebug.ini")
  #cd "$srcdir"/$pkg_src/debugclient
  #make DESTDIR="$pkgdir" install

  cd "$srcdir"/$pkg_src
  make INSTALL_ROOT="$pkgdir" install
  install -D -m 644 "$srcdir"/xdebug.ini "$pkgdir/${PHPCONFIG_SCANDIR}/xdebug.ini"

  install -D -m755 "./debugclient/debugclient" "${pkgdir}/usr/bin/debugclient${php_suffix}"
}
# Run this  before the backup file variables get evaluated
if [[ -z $PHPIZE_CMD ]]; then
    php_select
fi
