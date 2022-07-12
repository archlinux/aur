# 1.1.8 (github, pypi and conda 2022.07.12)
* Adapted setup.py to work with conda forge libraries on windows

# 1.1.8 (github, pypi 2022.07.11)
* Changed windows compilation to use MSVC 2019. Static compilation for windows, no
  longer need for dll files.

# 1.1.7 (github, pypi and conda 2022.06.03)
* Updated Readstat code to Release 1.1.8
* Solved issue with duplicated columns, #188
* Solved issue with no truncation of written files on windows #191

# 1.1.6 (github, pypi and conda 2022.05.09)
* Solved #183
* new parameter output_type to switch between returning a pandas dataframe
  or a dict of numpy arrays, partial solution for #184
* Implemented row_compression for writing sav files, solves #185

# 1.1.5 (github, pypi and conda 2022.04.28)
* Solved #159, #158, #163, #164, #172, #177
* Added new date formats for SAS and SPSS solves #170, #171
* Added check missing\_range type against variable type solves #180
* Removed np.float, solves #160
* Updated Readstat source code to Release 1.1.8 candidate 0

# 1.1.4 (github, pypi and conda 2021.12.02)
* Included new pandas datatypes Float32Dtype and Float64Dtype when writing. Soves #150.
* Forcing cythonization when installing from source solves #151.

# 1.1.3 (github, pypi and conda 2021.10.05)
* Updated Readstat source to version 1.1.17
* Improved error when reading dates and finding a string (#145)
* repaired not reading correctly metadata with multiprocessing (#146)

# 1.1.2 (github, pypi and conda 2021.05.05)
# correction when reading file paths in python <3.7

# 1.1.1 (github, pypi and conda 2021.05.05)
* Using os.fsencode when reading file paths to support file system encoding and Path-like objects (#123)
* Updated Readstat source to version 1.1.6, fixes #117
* Accepting dict as the column_label parameter for writing functions.

# 1.1.0 (github, pypi and conda 2021.03.02)
* added meta.readstat_variable_types to track the type of binary variable in the original file.

# 1.0.9 (github, pypi and conda 2021.02.16)
* Adding better error message for not accepting certain files types in multiprocessing, solves #105
* Fixing #106 writing failing when row 0 is removed from dataframe.
* Removing numpy deprecated objects solves #107.
* Adding support for pathlib.Path, soves #110.

# 1.0.8 (github, pypi and conda 2021.01.09)
* fixing order of categories

# 1.0.7 (github, pypi and conda 2021.01.09)
* Added formats_as_ordered_category to get an ordered category.
* Added value_formats in order to be able to set the variable format
  when writing.
# 1.0.6 (github, pypi and conda 2020.12.17)
* Updated Readstat to version 1.1.5, this fixes: reading sas7bdat file labels, 
  reading newer por files date-like columns, and few others.
* Corrected writing columns with numpy.float32 format.
 
# 1.0.5 (github, pypi and conda 2020.11.13)
* fixed sharing permissions when reading files on windows, fixes #87

# 1.0.4 (github, pypi and conda 2020.11.12)
* read_file_in_chunks can read chunks with multiprocessing.

# 1.0.3 (github, pypi 2020.11.06 and conda 2020.11.10)
* Improved performance specially for big files.
* added a method to read files in parallel
* added license information to setup.py

# 1.0.2 (github, pypi and conda 2020.09.05)
* Updated default widths for DATE and DATETIME formats (from Readstat src). That makes the files readable both in SPSS and PSPP,
  solves issue #69.
* added support for binary compressed sas7bdat files
* fixes writing XPT files v8 that can be read in SAS. Reading XPT v8 improved.
* fixes writing files with NaT values.
* fixes #72: variable display width with long strings.
* fixes #70: variable_measures not set when writing sav files
* updated Readstat to commit 02562413ded25e920b96bbbfc4d87ed062aacec8, version 1.1.4

# 1.0.1 (github, pypi and conda 20200819)
* updated readstat to commit f867d75af24cb5ca355befc8607e3a9ff1898f15, 
  fixes issue #67

# 1.0.0 (github, pypi and conda 20200616)
* improved error messages when column names have spaces
* updated readstat to release 1.1.3: improved support for columns with
  utf-8 characters.
* bumped version to first stable release as the library looks stable

# 0.3.4 (github, pypi and conda 20200520)
* corrected bug when writing and updating files fixes #17
* updated Readstat source to commit 3a53c088cb622f10a02723bbfd9b91d316995aab: better error message when the
  file is not a spss file

# 0.3.3 (github, pypi and conda 20200424)
* added capability to set_value_labels to handle subset of dataframes, solves #58

# 0.3.2 (github, pypi and conda 20200422)
* fixed bug when writing string columns with missing values (#54 and #55)

# 0.3.1 (github, pypi and conda 20200406
* Updated Readstat to commit a71b4e80dae729e236d63d42066e79ca646cd23b (on dev)
* Updated Readstat update fixes #3

# 0.3.0 (github, pypi and conda 20200406)
* Updated Readstat to Release 1.1.2, this did not fix #3
* added capacity to read and write files with paths starting with tilde
* added pandas as dependency > 0.24.0
* copying windows dlls inside pyreadstat folder in site-packages 

# 0.2.9 (github 26.08.2019, pypi and conda 27.08.2019)
* implemented ability to read files in chunks
* implemented write_por
* Readstat sources updated to release 1.1.0

# 0.2.8 (github, pypi, conda 30.07.2019)
* write user defined missing values, value labels for spss and stata
* write variable_display_width and variable_measure for spss
* breaking change: missing_user_values is now dict instead of set both for reading and writing.
* windows wheels build with appveyor + m2w64-toolchain. Wheels for python 2.7 not produced 
  anymore, instead setup.py raises an error if trying to compile with 2.7 on windows so that
  pip will raise this error when trying to install from source distribution.
* column_names_to_labels: new member in metadata object, a dict of column names to labels
* setup.py: ordering source files to make the compilation reproducible

# 0.2.7 (github, pypi, conda 27.06.2019)
* added writing capability.

# 0.2.6 (github, pypi, conda 15.06.2019)
* MANIFEST.in changed so that windows dlls get into the source distribution, setup.py
changed so that those get installed only on windows but not unix.
* Implemented option disable_datetime_conversion for all reading functions in order
to skip date/datetime and time object conversion.
* Updated Readstat Sources to Release Version 1.0.1

# 0.2.5 (github, pypi and conda 09.05.2019)
* Same as 0.2.4, just fixed issues in source distribution so that conda build 
  succeeds.

# 0.2.4 (github and pypi 08.05.2019)
* encoding support for xpt files.
* support for user defined missing character values in sav.
* Updated Readstat Sources to Release 1.0

# 0.2.3 (github 04.02.2019)
* User defined values fixed for sas7bdat, implemented for sas7bcat and dta.
* Readstat sources updated.

# 0.2.2 (github 18.01.2019)
* Implemented support for reading international characters in files.

# 0.2.1 (github 18.12.2018, release tag, conda-forge 04.02.2019)
* Implemented user defined missing values for read_sas7bdat. Currently not working for 64 bit files.
* Corrected datetime transformations for stata dta files, sample.dta updated
* cython updated from 26.1 to 29.1
* Readstat source update, latest version as 17.12.2018 (latest commit: b52b77447d293f0fd530aabdab3330909a61bb8d)
* The latest readstat brings: POR files support improved (sample.por updated), sas7bcat support improved, improvements
  for sav files. 

# 0.2.0 (github 19.10.2018, Pypi 19.10.2018)
* Implemented usecols to be able to read only selected columns.
* Readstat source updated to fix a [bug](https://github.com/WizardMac/ReadStat/issues/153) in usecols, latest version
as 17.10.2018 (latest commit: 727bfb87aa332da0df96b77d86694c0e9c464723)
* Implemented user defined missing values (user_missing keyword) for read_sav (only for SPSS files)

# 0.1.9 (github 12.10.2018, Pypi 15.10.2018)

* Bug when reading sas7bcat files [#4](https://github.com/Roche/pyreadstat/issues/4) fixed in 
readstat [#152](https://github.com/WizardMac/ReadStat/issues/152). Readstat src files updated with latest version
as of 12.10.2018 (latest commit: 4c798478ed1eff35ed16c067a3b0b3fd0a9a0561)

# 0.1.8
* Installation on mac fixed (static linking iconv, [#2](https://github.com/Roche/pyreadstat/issues/2))

# 0.1.7
* same as 0.1.8, had to bump the version in order to fix the description in pypi.

# 0.1.6
* First public release
