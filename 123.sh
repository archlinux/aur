#!/bin/sh

# Setup wrapper for 123 since setup123 isn't working

setupfile="$HOME/.l123set"


if ! [ -e "$setupfile" ]; then
    echo -n "
Since this is the first time you're running 123, settings is being copied for you into $setupfile.

You can edit this as you see fit.

Press return to continue"
    read; 
    cat <<EOF > "$setupfile"
1001 Lotus 1-2-3 Version "10"
1002 Base Directory "/usr/share/lotus/"
1003 Printer Interface "lpr -o dest={dest} {file}"
1004 Graphics Driver "dumb" "ega egas25cc.vbd"
1007 Help Language "USA English" "USA-English"
1011 Display Char. Set "US ASCII" "l_ascii.bun"
1005 Country Driver "USA-English Numbers First" "l13cUSF3.cbd"
1006 Resource Language "USA English" "USA-English"
1012 File Character Set "US ASCII" "l_ascii.bun"
1008 File Name Mode "UNIX file name mode" "0"
1010 Keyboard "xterm"
EOF
fi
exec /usr/share/lotus/bin/123.bin $@
