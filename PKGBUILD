# Maintainer: RiddlerXenon riddler.xenon@gmail.com
pkgname=ddh
pkgver=1.0.0
pkgrel=1
pkgdesc="Dynamic Display Handler"
arch=('any')
url="https://github.com/RiddlerXenon/DynamicDisplayHandler"
license=('GPL')
depends=('xorg-server' 'systemd' 'awk' 'grep' 'sed')
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('336259b5e7b8637bdd81dfe06cac982326b15f015feb21ad5d0da6247790f44a')

package() {
    cd "$srcdir/DynamicDisplayHandler-$pkgver"

    install -Dm755 ddh.sh "$pkgdir/usr/local/bin/ddh.sh"
    install -Dm644 ddh.service "$pkgdir/usr/lib/systemd/system/ddh.service"
}

post_install() {
    user_home=$(getent passwd $(logname) | cut -d: -f6)
    config_file="$user_home/.config/ddh/config.ini"
    mkdir -p $(dirname $config_file)
    chown -R $(logname):$(logname) $user_home/.config/ddh

    connected_displays=($(xrandr | awk '/ connected / {print $1}'))

    declare -A max_refresh_rates
    declare -A closest_refresh_rates
    declare -A resolutions

    for display in ${connected_displays[@]}; do
        max_resolution=$(xrandr | grep -P "^$display" -A1 | tail -n1 | awk '{print $1}')
        refresh_rates=($(xrandr -q | grep -P "^$display" -A1 | tail -n 1 | awk '{$1=""; print $0}' | sed 's/^ *//' | tr -dc '0-9. '))

        max_refresh_rates[$display]=$(echo ${refresh_rates[@]} | tr ' ' '\n' | sort -n | tail -n 1)
    
        closest_refresh_rates[$display]=$(echo ${refresh_rates[@]} | tr ' ' '\n' | sort -n | awk -v target=60 'function abs(x){return ((x < 0) ? -x : x)} BEGIN{min=1e9}{
            if (abs($1-target)<min) {
                min=abs($1-target)
                val=$1
            }
        }END{print val}')

        abs() {
            if [ $1 -lt 0 ]; then
                echo "$((-1 * $1))"
            else
                echo "$1"
            fi
        }

        resolutions[$display]=$max_resolution
    done

    ac_dir=$(ls /sys/class/power_supply/ | grep -P "AC")
    ac=$(cat /sys/class/power_supply/$ac_dir/online)

    if [ ! -f $config_file ]; then
        echo "Creating config file at $config_file."    
    
        echo "[display]" >> $config_file
        echo "DISPLAYS=${connected_displays[@]}" >> $config_file
        echo -n "DISPLAYS_POSITIONS=" >> $config_file
        for display in ${connected_displays[@]}; do
            if [[ $display != ${connected_displays[0]} ]]; then
                echo -n "right-of " >> $config_file
            else
                echo -n "primary " >> $config_file
            fi
        done
        echo >> $config_file

        echo "PRIMARY_DISPLAY=${connected_displays[0]}" >> $config_file

        echo -n "MAX_REFRESH_RATES=" >> $config_file
        for display in ${connected_displays[@]}; do
            echo -n "${max_refresh_rates[$display]} " >> $config_file
        done
        echo >> $config_file

        echo -n "REFRESH_RATES=" >> $config_file
        for display in ${connected_displays[@]}; do
            echo -n "${closest_refresh_rates[$display]} " >> $config_file
        done
        echo >> $config_file

        echo -n "RESOLUTIONS=" >> $config_file
        for display in ${connected_displays[@]}; do
            echo -n "${resolutions[$display]} " >> $config_file
        done
        echo >> $config_file
        echo >> $config_file
    
        echo "[power]" >> $config_file
        echo "AC=$ac" >> $config_file
        echo "AC_BRIGHTNESS=100" >> $config_file
        echo "BATTERY_BRIGHTNESS=30" >> $config_file

        echo "Config file created."
    fi


    systemctl daemon-reload
    systemctl enable ddh
    systemctl start ddh
}
