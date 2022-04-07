## Before build:
### Update MD5
``` sh
md5sum ./lightdm-webkit-theme-osmos-2.0.1.tar.gz
```

.SRCINFO files may be generated using makepkg:
``` sh
makepkg --printsrcinfo > .SRCINFO
```

Make package for test
```
makepkg -si
```