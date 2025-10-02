# Table of contents
1. [Configuration](#configuration)
    * [file location](#which-file-is-used)
    * [config syntax](#syntax)
2. [Command-line Arguments](#command-line-arguments)
3. [Return Codes](#return-codes-and-errors)
    * [0](#return-code-0)
    * [1](#error-1)
    * [-1](#error--1-255)

# Configuration

A complete configuration file with comments can be found as [`albafetch.conf`](albafetch.conf) in this repository.

## Which file is used?
Albafetch supports a series of configuration options that can be placed inside of a configuration file located in `$XDG_CONFIG_HOME/albafetch.conf` (`~/.config/albafetch.conf` is parsed if `XDG_CONFIG_HOME` is not set).

Alternatively, if this file is not found, albafetch will look for `XDG_CONFIG_HOME/albafetch/albafetch.conf` (or `~/.config/albafetch/albafetch.conf`). This can be useful if you want to keep multiple configurations in the same folder.

A custom file might be specified using the `--config` argument.

## Syntax
The config should contain `entry = "value",` pairs (using quotation marks is mandatory). During parsing, albafetch will look for the first string matching the entry (which you can find in [the default config](albafetch.conf)), then locate the next quotation mark, check whether there is another quotation mark following it and if so take the value between the two.

There are three different types of data that will be parsed:
* Strings: No more than N bytes between the quotation marks will be read, but every single one of those bytes will be used.
           These variables will be marked in the example config with a `; str [N]` following the option.
* Integers: An integer smaller or equal to N will be parsed using the C standard `atoi()` function (use `man 3 atoi` for specific information).
            The provided value will always be treaded as unsigned (using something like -1 will therefore be treated as 2³²-1, 4294967295)
            These variables will be marked in the example config with a `; int [N]` following the option.
* Booleans: The program will recognize anything different from "false" as "true".
            These variables will be marked in the example config with a `; bool` following the option.

All of this means that `AB"CboldDEF"whatever lol"wo"w` will be parsed the exact same way as `bold = "true",` or `bold""`, but I would not recommend this as it makes everything less readable. I might also stop supporting this at any moment, so the specified syntax is the only one that's guaranteed to work.
I might also make the parser stricter in the future and configs written this way might stop working entirely.

Also, any `~` that you may want to use will not get expanded to `/home/username` and will instead be parsed as it is. If you want to reference your home directory inside of this config file (e.g. to specify the path to a custom ascii art) you will have to do so manually. 

A specific option that's worth spending some extra time talking about is `ascii_art`. This option expects the path to a file that contains a custom logo. Its syntax is really straight-forward: You can specify up to 40 lines you want to use as logo (which can not be longer than 256 bytes long, including the closing null character. Note that Unicode characters will be bigger than 1B), and eventually a color on the first line. Anything that's not recognized as a color ("colors" are defined as black, red, green, yellow, blue, purple, cyan, gray or white) Will be considered the first line of the logo.

This is what a logo file could look like:
```
blue
first_line 
second_line
third_line 
fourth_line
```

This file should **not** end with an empty line, and every logo line should be equally long (you can achieve this simply by adding spaces at the end of the shorter lines), or albafetch will have alignment problems. There is no way to add comments in this file, everything will be used as it is written (except some escape sequences, more about this further down).

You can find an example logo file in this repository, more specifically [example_logo.txt](example_logo.txt).

The config can also contain an ordered array of the modules that you want albafetch to print. The array has a vastly different syntax in the config, as shown here:
```
modules = {
    "module1",
    "module2",
    "module3",
}
```
You can found a list of the accepted modules inside of [the default config](albafetch.conf). Any other value will be considered as plain text (and will be printed as-is, with no label nor dash).

To parse this section, albafetch first locates a string matching `modules` in the config file, takes the part between the following curly braces, and reads the text between the following pairs of quotation marks.
As for normal options, this allows some weird formats, like `modules{"module1""module2""module3"}`, but I also invite anyone to consider the parsing of similar strings undefined behavior.

Anything that doesn't match what the parser is looking for will be ignored, but the usage of explicit comments is encouraged: whatever stands between a `;` or an `#` and the end of the line will not be read as part of the config. You can, however, still freely use `#` and `;` in your config, as they will **not** be considered when enclosed in a string (between a pair of `"`).
There is currently no way to use multi-line comments. 

When albafetch parses a file (config or custom ascii art), it will also automatically unescape some escape sequences, like the following table shows:
| File content | How it will be parsed |
| ---          | ---                   |
| "\\e"        | '\\033' (ANSI escape) |
| "\\033"      | '\\033' (ANSI escape) |
| "\\n"        | '\\n' (new line)      |
| "\\X"        | 'X' (everything else) |

Since it might be useful, here are some of the most useful ANSI escape sequences (you can find a more complete list [here](https://stackoverflow.com/a/33206814))
| Function | Escape   |
| ---      | ---      |
| Reset    | `\e[0m`  |
| Bold     | `\e[1m`  |
| Black    | `\e[30m` |
| Red      | `\e[31m` |
| Green    | `\e[32m` |
| Yellow   | `\e[33m` |
| Blue     | `\e[34m` |
| Purple   | `\e[35m` |
| Cyan     | `\e[36m` |
| White    | `\e[97m` |

Please note that these colors will be displayed as defined in the configuration of your terminal.
You can check how a certain string will look using something like `echo -e "\e[1mHello, \e[31mWorld\e[0m"`.
These escape sequences may be placed at any point inside of your config or custom ascii art and they *should* get parsed correctly (as long as you stay inside of the size limits defined for each field). You can even use multiple inside a single line.

# Command-line arguments
albafetch accepts a few command line arguments, which can be used to override certain values set in the config file.

A short explanation of what every argument does, including every accepted and default value, can be obtained by running `albafetch --help`

Here they are:
* `--help` (or `-h`): Prints a small guide on the program usage and return RET_OK.
* `--color` (or `-c`): Followed by the color you want to set, this option will override the config `default_color` entry and set a custom color for the whole output.
* `--bold` (or `-b`): Followed by a boolean "on" or "off", this option overrides the config `bold` entry and enables or disables the usage of bold in the output.
* `--logo` (or `-l`): This option, followed by the logo you want to print, overrides the config `logo` entry and makes albafetch print a custom logo instead of the default one.
* `--align` (or `-a`): Followed by a boolean "on" or "off", this option overrides the config `align_infos` entry and enables of disables the alignment of the infos in the printed output.
* `--ascii`: Followed by a valid file path, it lets you pick a file containing a custom ascii art that you'd like to use. When this option is used together with `--logo`, the latter has priority.
* `--config`: Followed by a valid file path, this changes the config file that will be parsed to look for a valid configuration.
* `--no-logo`: Using this will make albafetch not print a logo or ascii art (while still using it to get the color that should be printed).
* `--no-config`: Using this will prevent any config file (provided using `--config` or the default one) from being used.

# Return codes and errors
| Return Code   | Meaning               |
| ---           | ---                   |
| 0             | Correct execution     |
| 1             | Bad argument usage    |
| -1            | Bad environment       |

## Return code 0
As you probably already know, this is not an error, but it simply indicates that everything executed correctly. No need to worry.

## Error 1 
This is probably the result of a wrong usage of some command-line arguments. One or more error messages will be printed to stderr telling you exactly which argument(s) was used wrong.

## Error -1 (255)
This error should only pop up if the program was not able to get the `HOME` environment variable, which should never happen. If you get this return code, you are probably experiencing worse than this dumb program not working.

---

###### © Aaron Blasko
