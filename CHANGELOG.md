# Changelog

## 2025-09-07 1.0.4
- [Refactored script infrastructure: packed all code in functions, based defaults assignment to json dict.](https://github.com/mvtab/aurx/commit/ad9cef9695b30c59576a1af06c6469ce1675ab86)
- [Added changelog.](https://github.com/mvtab/aurx/commit/2046024527749faaf70366c7e63d17a523073d26)
- [Added curl-opts opt.](https://github.com/mvtab/aurx/commit/81700eee6fde0538b2119d1e29703431172dc56c)
- [Added git-opts opt.](https://github.com/mvtab/aurx/commit/5d117bbddc78c1768c700704eb13d9a1d0c6a788)

### Breaking changes

- [Refactored short options: removed some redundant ones and renamed some to be more intuitive.](https://github.com/mvtab/aurx/commit/3c5f18d54f866687ec18434226b21cf526836962)

Full changes:

operation|option|short old|short new
:---|:---|:---|:---
general|--persistent-path|-p|none
general|--verbosity|-v|none
install|--cleanup|-c|none
install|--clean-operation|-C|none
install|--git-opts|-g|-G
install|--overwrite-existing|-W|none
install|--source-path|-s|none
install|--wipe-existing|-w|none
search|--curl-opts|-l|-C
search|--maintained|-m|none
search|--no-mark-installed|-i|none
search|--no-mark-update|-u|none
search|--no-out-of-date|-O|none
search|--order-by|-o|none
search|--output|-z|-o
search|--parallel|-P|-p
search|--search-results|-r|none
search|--search-criteria|-S|none
search|--sort-by|-b|none
suggest|--curl-opts|-l|-C
suggest|--order-by|-o|none
suggest|--search-results|-r|none
suggest|--output|-z|-o
update|--block-overwrite|-B|none
update|--keep-sources|-k|none
update|--keep-failed-sources|-K|none
list|--no-mark-installed|-i|none
list|--no-mark-update|-u|none
list|--parallel|-P|-p


## 2025-16-07 1.0.3
- Removed color output in suggest,
- Added version operation,
- Tidied up sanity and system checks into their own functions,
- Added new output type: json-lines and differentiated between suggest and search output possibilities,
- Fixed variable scope in print_aur_data.

## 2025-15-07 1.0.2

- Moved search criteria "suggest" to it's own operation.
